<?php

class Numbers
{
    private $numbers;
    private $dependencies = [];

    public function __CONSTRUCT($numbers, $translator)
    {
        $this->numbers = $numbers;
        $this->dependencies["translator"] = $translator;
    }

    public function get()
    {
        return $this->numbers;
    }

    public function getAtIndex($index)
    {
        return $this->numbers[$index];
    }

    public function getFirst()
    {
        return $this->getAtIndex(0);
    }

    public function translateInto($index, $language)
    {
        $translator = $this->dependencies["translator"];
        return $translator->translate($this->numbers[$index], $language);
    }

}
