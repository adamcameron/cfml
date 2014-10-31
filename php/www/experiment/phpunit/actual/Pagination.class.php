<?php

class Pagination
{
    protected $extremityBuffer  = 2;
    protected $proximityBuffer  = 3;


    public function filter($pages, $page)
    {
        $pageCount = count($pages);

        $filters = $this->setNextPrevious($pageCount, $page);

        $filters["ellipses"] = $this->setEllipses($pageCount, $page);

        $filters["pages"] = $this->filterPages($pages, $page, $filters);

        return $filters;
    }


    private function setNextPrevious($pageCount, $page)
    {
        return [
            "showPrevious"   => $pageCount && $page != 1,
            "showNext"       => $pageCount && $page != $pageCount
        ];
    }


    private function setEllipses($pageCount, $page)
    {
        $ellipses = [false,false];
        if ($page >= $this->extremityBuffer + $this->proximityBuffer + 2){ // 2 = 1 for current page, 1 for at least one page to skip
            $ellipses[0] = true;
        }

        if ($page <= ( $pageCount - ($this->extremityBuffer + $this->proximityBuffer + 1))){
            $ellipses[1] = true;
        }
        return $ellipses;
    }


    private function filterPages($pages, $page, $filters)
    {
        $pageCount = count($pages);

        $filteredPages = [];
        foreach($pages as $index=>$value){
            $pageNumber = $index+1;
            if ($filters["ellipses"][0]){
                $currentPageIsCloseToBeginning = $pageNumber <= $this->extremityBuffer;
                $currentPageIsCloseToSelectedPage = $pageNumber >= $page - $this->proximityBuffer;
                $currentPageIsInFilterZone = !($currentPageIsCloseToBeginning || $currentPageIsCloseToSelectedPage);
                if ($currentPageIsInFilterZone){
                    continue;
                }
            }
            if ($filters["ellipses"][1]){
                $currentPageIsCloseToEnd = $pageNumber >= ($pageCount - $this->extremityBuffer + 1);
                $currentPageIsCloseToSelectedPage = $pageNumber <= ($page + $this->proximityBuffer);
                $currentPageIsInFilterZone = !($currentPageIsCloseToEnd || $currentPageIsCloseToSelectedPage);
                if ($currentPageIsInFilterZone){
                    continue;
                }
            }
            $filteredPages[$index] = $value;
        }
        return $filteredPages;
    }


}
