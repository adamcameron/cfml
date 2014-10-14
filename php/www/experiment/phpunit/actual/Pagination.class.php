<?php

class Pagination {

    public function filter($pages, $page){
        $showPrevious = $page > 1;
        return [
            "pages"         => null,
            "showNext"      => null,
            "showPrevious"  => $showPrevious,
            "ellipses"      => null
        ];
    }
}