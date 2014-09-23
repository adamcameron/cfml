<?php
// Colours.class.php

class Colours implements iterator
{
    private $colours;
    private $index;

    public function __construct($colours)
    {
        $this->colours = $colours;
        $this->rewind();
    }

    public function current()
    {
        return $this->colours[$this->index];
    }

    public function next()
    {
        $this->index++;
        return $this;
    }

    public function key()
    {
        return $this->index;
    }

    public function valid()
    {
        return array_key_exists($this->index, $this->colours);
    }

    public function rewind()
    {
        $this->index = 0;
        return $this;
    }

}
