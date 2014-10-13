<?php
class PaginationTest extends PHPUnit_Framework_TestCase {

    protected $pagination;

    function setup(){
        $this->pagination = new Pagination();
    }

    /** @runInSeparateProcess  */
    function testFilter_exists(){
        $this->pagination->filter();
        // won't get this far if it doesn't exist
    }

}