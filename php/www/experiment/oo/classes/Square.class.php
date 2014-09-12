<?php
// Square.class.php
class Square extends TwoDimensionalShape
{
    protected $sideLength;

    public function __construct($sideLength)
    {
        $this->sideLength = $sideLength;
    }

    public function getPerimeter()
    {
        return $this->sideLength * 4;
    }

    public function getArea()
    {
        return $this->sideLength * $this->sideLength;
    }

}
