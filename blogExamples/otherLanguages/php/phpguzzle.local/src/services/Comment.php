<?php
// Comment.php

namespace dac\guzzledemo\services;

class Comment {

	protected $app;
	protected $guzzleClient;
	protected $loggerService;

	function __construct($commentFactory, $guzzleClient, $loggerService){
		$this->commentFactory	= $commentFactory;
		$this->guzzleClient		= $guzzleClient;
		$this->loggerService	= $loggerService;
	}

	function getCommentsForArticle($articleId, &$comments){
		$loggerService = $this->loggerService;
		$loggerService->getElapsed("services/Comment getCommentsForArticle(): start");

		$response = $this->guzzleClient->get('http://cf11.local:8511/rest/blog/comment/articleId/' . $articleId, ["future"=>true]);
		$loggerService->getElapsed("services/Comment getCommentsForArticle(): After get()");

		$response->then(function($response) use (&$comments, $loggerService, $articleId) {
			$loggerService->getElapsed("services/Comment getCommentsForArticle(): top of then()");
			$commentsAsArray = $response->json();

			$commentFactory = $this->commentFactory;
			foreach ($commentsAsArray as $commentAsArray){
				$comments[] = $commentFactory(
					$commentAsArray["ID"],
					$articleId,
					$commentAsArray["DATE"],
					$commentAsArray["AUTHOR"],
					$commentAsArray["BODY"]
				);
			}

			return $response;
		});
		$loggerService->getElapsed("services/Comment getCommentsForArticle(): bottom");
		return $response;
	}


}