<?php

class Pagination {

    protected $extremityBuffer  = 2;
    protected $proximityBuffer  = 3;

    public function filter($pages, $page){
        $pageCount = count($pages);

        $showPrevious   = $pageCount && $page != 1;
        $showNext       = $pageCount && $page != $pageCount;

        $ellipses = [false,false];
        if ($page >= $this->extremityBuffer + $this->proximityBuffer + 2){ // 2 = 1 for current page, 1 for at least one page to skip
            $ellipses[0] = true;
        }

        if ($page <= ( $pageCount - ($this->extremityBuffer + $this->proximityBuffer + 1))){
            $ellipses[1] = true;
        }

        $filteredPages = [];
        foreach($pages as $index=>$value){
            $pageNumber = $index+1;
            if ($ellipses[0]){
                $currentPageIsCloseToBeginning = $pageNumber <= $this->extremityBuffer;
                $currentPageIsCloseToSelectedPage = $pageNumber >= $page - $this->proximityBuffer;
                $currentPageIsInFilterZone = !($currentPageIsCloseToBeginning || $currentPageIsCloseToSelectedPage);
                if ($currentPageIsInFilterZone){
                    continue;
                }
            }
            if ($ellipses[1]){
                $currentPageIsCloseToEnd = $pageNumber >= ($pageCount - $this->extremityBuffer + 1);
                $currentPageIsCloseToSelectedPage = $pageNumber <= ($page + $this->proximityBuffer);
                $currentPageIsInFilterZone = !($currentPageIsCloseToEnd || $currentPageIsCloseToSelectedPage);
                if ($currentPageIsInFilterZone){
                    continue;
                }
            }
            $filteredPages[$index] = $value;
        }

        return [
            "pages"         => $filteredPages,
            "showNext"      => $showNext,
            "showPrevious"  => $showPrevious,
            "ellipses"      => $ellipses
        ];
    }
}