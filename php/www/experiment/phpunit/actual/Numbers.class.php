<?php

class Numbers {

    private $numbers;
    private $dependencies = [];

    function __CONSTRUCT($numbers, $translator){
        $this->numbers = $numbers;
        $this->dependencies["translator"] = $translator;
    }

    function get(){
        return $this->numbers;
    }

    function getAtIndex($index){
        return $this->numbers[$index];
    }

    function getFirst(){
        return $this->getAtIndex(0);
    }

    function translateInto($index, $language){
        $translator = $this->dependencies["translator"];
        return $translator->translate($this->numbers[$index], $language);
    }

}