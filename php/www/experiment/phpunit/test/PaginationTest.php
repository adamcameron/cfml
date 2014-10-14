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

    function testFilter_returnsAnArray(){
        $result = $this->pagination->filter();
        $this->assertTrue(is_array($result), "Returned value should be an array");
    }

    function testFilter_returnsAnArrayWithExpectedKeys(){
        $result = $this->pagination->filter();

        $resultKeys = array_keys($result);
        sort($resultKeys);

        $this->assertEquals(
            ["ellipses", "pages", "showNext", "showPrevious"],
            $resultKeys,
            "Returned array should contain expected keys"
        );
    }

    function testFilter_previousIsFalseWhenOnPage1(){
        $result = $this->pagination->filter([], 1);
        $this->assertFalse($result["showPrevious"], "showPrevious should be false when on the first page of results");

    }

}