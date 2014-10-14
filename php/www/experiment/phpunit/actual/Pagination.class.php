<?php

class Pagination {

    public function filter($pages, $page){
        $showPrevious = false;
        return [
            "pages"         => null,
            "showNext"      => null,
            "showPrevious"  => $showPrevious,
            "ellipses"      => null
        ];
    }
}