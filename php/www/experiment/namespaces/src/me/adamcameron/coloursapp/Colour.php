<?php

namespace me\adamcameron\coloursapp;

class Colour{
	
	protected $colour;	

	function __construct($colour){
		$this->colour = $colour;
	}

	function getColour(){
		return $this->colour;
	}

}