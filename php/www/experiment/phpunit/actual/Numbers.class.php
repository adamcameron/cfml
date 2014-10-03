<?php

require dirname(__FILE__) . "\Translator.class.php";

class Numbers {

    private $numbers;

    function __CONSTRUCT($numbers){
        $this->numbers = $numbers;
        $this->translator = new Translator();
    }

    function get(){
        return $this->numbers;
    }

    function getAtIndex($index){
        return $this->numbers[$index];
    }

    function translateInto($index, $language){
        return $this->translator->translate($this->numbers[$index], $language);
    }

}