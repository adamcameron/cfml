<?php

class Pagination {

    protected $extremityBuffer  = 2;
    protected $proximityBuffer  = 3;

    public function filter($pages, $page){
        $showPrevious   = count($pages) && $page != 1;
        $showNext       = count($pages) && $page != count($pages);

        $ellipses = [false,false];

        if ($page >= $this->extremityBuffer + $this->proximityBuffer + 2){ // 2 = 1 for current page, 1 for at least one page to skip
            $ellipses[0] = true;
        }

        if ($page <= (count($pages) - ($this->extremityBuffer + $this->proximityBuffer + 1))){
            $ellipses[1] = true;
        }

        $filteredPages = [];
        foreach($pages as $index=>$value){
            $pageNumber = $index+1;
            if ($ellipses[0]){
                if ($pageNumber > $this->extremityBuffer && $pageNumber < $page - $this->proximityBuffer){
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