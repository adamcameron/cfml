<?php
// Article.php

namespace dac\guzzledemo\beans;

class Article {

	protected $id;
	protected $date;
	protected $title;
	protected $body;

	function __construct($id, $date, $title, $body){
		$this->id = $id;
		$this->date = $date;
		$this->title = $title;
		$this->body = $body;
	}

	function getId(){
		return $this->id;
	}

	function getDate(){
		return $this->date;
	}

	function getTitle(){
		return $this->title;
	}

	function getBody(){
		return $this->body;
	}

}