<?php

namespace dump;

class C {
    public $publicProperty;
    protected $protectedProperty;
    private $privateProperty;

    function __construct($publicProperty, $protectedProperty, $privateProperty){
        $this->publicProperty = $publicProperty;
        $this->protectedProperty = $protectedProperty;
        $this->privateProperty = $privateProperty;
    }

    public function getProperties(){
        return $this->getAsArray();
    }

    private function getAsArray(){
        return [
            'public' => $this->publicProperty,
            'protected' => $this->protectedProperty,
            'private' => $this->privateProperty
        ];
    }
}