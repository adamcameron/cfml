<?php
// Shape.class.php
abstract class Shape implements Serialisable
{
    protected $dimensions;

    public function getDimensions()
    {
        return $this->dimensions;
    }

}
