<?php
class PaginationTest extends PHPUnit_Framework_TestCase {

    protected $pagination;

    function setup(){
        $this->pagination = new Pagination();
    }

    /** @runInSeparateProcess  */
    function testFilter_exists(){
        $this->pagination->filter([], 0);
        // won't get this far if it doesn't exist
    }

    function testFilter_returnsAnArray(){
        $result = $this->pagination->filter([], 0);
        $this->assertTrue(is_array($result), "Returned value should be an array");
    }

    function testFilter_returnsAnArrayWithExpectedKeys(){
        $result = $this->pagination->filter([], 0);

        $resultKeys = array_keys($result);
        sort($resultKeys);

        $this->assertEquals(
            ["ellipses", "pages", "showNext", "showPrevious"],
            $resultKeys,
            "Returned array should contain expected keys"
        );
    }

    function testFilter_previous_isFalseWhenOnPage1(){
        $result = $this->pagination->filter([], 1);
        $this->assertFalse($result["showPrevious"], "showPrevious should be false when on the first page of results");
    }

    function testFilter_previous_isTrueOnSubsequentPages(){
        $result = $this->pagination->filter([], 2);
        $this->assertTrue($result["showPrevious"], "showPrevious should be true on pages other than the first page");
    }

}