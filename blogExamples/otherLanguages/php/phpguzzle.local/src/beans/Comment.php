<?php
// Comment.php

namespace dac\guzzledemo\beans;

class Comment {

	protected $id;
	protected $articleId;
	protected $date;
	protected $author;
	protected $body;

	function __construct($id, $articleId, $date, $author, $body){
		$this->id = $id;
		$this->id = $articleId;
		$this->date = $date;
		$this->author = $author;
		$this->body = $body;
	}

	function getId(){
		return $this->id;
	}

	function getArticleId(){
		return $this->articleId;
	}

	function getDate(){
		return $this->date;
	}

	function getAuthor(){
		return $this->author;
	}

	function getBody(){
		return $this->body;
	}

}