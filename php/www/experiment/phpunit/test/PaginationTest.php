<?php
class PaginationTest extends PHPUnit_Framework_TestCase {

    protected $pagination;
    protected $baselinePages    = ["page1","page2","page3"];
    protected $extremityBuffer  = 2;
    protected $proximityBuffer  = 3;

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

    function testFilter_previous_isFalseWhenOnFirstPage(){
        $result = $this->pagination->filter($this->baselinePages, 1);
        $this->assertFalse($result["showPrevious"], "showPrevious should be false when on the first page of results");
    }

    function testFilter_previous_isTrueOnSubsequentPages(){
        $result = $this->pagination->filter($this->baselinePages, 2);
        $this->assertTrue($result["showPrevious"], "showPrevious should be true on pages other than the first page");
    }

    function testFilter_previous_isFalseIfNoPages(){
        $result = $this->pagination->filter([], 2);
        $this->assertFalse($result["showPrevious"], "showPrevious should be false if there are no pages");
    }

    function testFilter_next_isFalseWhenOnLastPage(){
        $result = $this->pagination->filter($this->baselinePages, count($this->baselinePages));
        $this->assertFalse($result["showNext"], "showNext should be false when on the last page of results");
    }

    function testFilter_next_isTrueOnEarlierPages(){
        $result = $this->pagination->filter($this->baselinePages, count($this->baselinePages) - 1);
        $this->assertTrue($result["showNext"], "showNext should be true on pages other than the last page");
    }

    function testFilter_next_isFalseIfNoPages(){
        $result = $this->pagination->filter([], 2);
        $this->assertFalse($result["showNext"], "showNext should be false if there are no pages");
    }

    function testFilter_ellipses_firstTrueWhenPageGreaterThanBuffer(){
        $minPageWithInitialEllipsis = $this->extremityBuffer + $this->proximityBuffer + 2;

        $testPages = SELF::getTestPages($minPageWithInitialEllipsis);

        $result = $this->pagination->filter($testPages, $minPageWithInitialEllipsis);
        $this->assertTrue($result["ellipses"][0], "First ellipses value should be true if on page {$minPageWithInitialEllipsis}+");
    }

    function testFilter_ellipses_firstTrueWhenPageAtBuffer(){
        $minPageWithInitialEllipsis = $this->extremityBuffer + $this->proximityBuffer + 1;

        $testPages = SELF::getTestPages($minPageWithInitialEllipsis);

        $result = $this->pagination->filter($testPages, $minPageWithInitialEllipsis);
        $this->assertFalse($result["ellipses"][0], "First ellipses value should be false if on page {$minPageWithInitialEllipsis}");
    }

    function testFilter_ellipses_secondTrueWhenPageLessThanBuffer(){
        $minPageWithLatterEllipsis = $this->extremityBuffer + $this->proximityBuffer + 2;

        $testPages = SELF::getTestPages($minPageWithLatterEllipsis);

        $result = $this->pagination->filter($testPages, 1);
        $this->assertTrue($result["ellipses"][1], "Second ellipses value should be true if on page 1 of {$minPageWithLatterEllipsis}");
    }

    protected static function getTestPages($count){
        return array_map(function($index){
            return "page$index";
        }, range(1, $count));
    }

}