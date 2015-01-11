<?php
// Reference.php

namespace dac\guzzledemo\beans;

class Reference {

	protected $id;
	protected $articleId;
	protected $title;
	protected $link;

	function __construct($id, $articleId, $title, $link){
		$this->id = $id;
		$this->id = $articleId;
		$this->title = $title;
		$this->link = $link;
	}

	function getId(){
		return $this->id;
	}

	function getArticleId(){
		return $this->articleId;
	}

	function getTitle(){
		return $this->title;
	}

	function getLink(){
		return $this->link;
	}

}