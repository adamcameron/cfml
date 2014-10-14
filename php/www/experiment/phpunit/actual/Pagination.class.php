<?php

class Pagination {

    public function filter($pages, $page){
        $showPrevious   = count($pages) && $page != 1;
        $showNext       = count($pages) && $page != count($pages);
        return [
            "pages"         => null,
            "showNext"      => $showNext,
            "showPrevious"  => $showPrevious,
            "ellipses"      => null
        ];
    }
}