<?php
class Numbers {

    private $numbers;

    function __CONSTRUCT($numbers){
        $this->numbers = $numbers;
    }

    function get(){
        return $this->numbers;
    }
}