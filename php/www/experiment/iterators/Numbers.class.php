<?php
// Numbers.class.php

class Numbers implements Iterator
{
    private $numbers;
    private $index;

    public function __construct()
    {
        $this->numbers = [];
        $this->index = null;
    }

    public function push($english,$maori)
    {
        array_push($this->numbers, ["english"=>$english, "maori"=>$maori]);
        $this->index = sizeof($this->numbers) - 1; //stoopid zero-indexed arrays :-|
        return $this;
    }

    public function current()
    {
        return $this->numbers[$this->index];
    }

    public function next()
    {
        $this->index++;
    }

    public function key()
    {
        return $this->index;
    }

    public function valid()
    {
        return array_key_exists($this->index, $this->numbers);
    }

    public function rewind()
    {
        $this->index = 0;
    }

}
