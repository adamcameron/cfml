<?php
// Comment.php

namespace dac\guzzledemo\services;

class Comment {

	protected $guzzleClient;
	protected $loggerService;
	protected $commentEndPoint;


	function __construct($commentFactory, $guzzleClient, $loggerService, $commentEndPoint){
		$this->commentFactory	= $commentFactory;
		$this->guzzleClient		= $guzzleClient;
		$this->loggerService	= $loggerService;
		$this->commentEndPoint	= $commentEndPoint;
	}

	function getCommentsForArticle($articleId, &$comments){
		$loggerService = $this->loggerService;

		$response = null;
		$loggerService->logTaskTime("services/Comment GuzzleClient->get()", function() use (&$response, $articleId) {
			$response = $this->guzzleClient->get($this->commentEndPoint . $articleId);
		});

		$response->then(function($response) use (&$comments, $loggerService, $articleId) {
			$loggerService->logTaskTime("services/Comment createComments()", function() use ($response, &$comments, $articleId) {
				$this->createComments($response->json(), $comments, $articleId);
			});
			return $response;
		});
		return $response;
	}

	function getCommentsRequest($articleId, &$comments){
		$loggerService = $this->loggerService;
		$request = $this->guzzleClient->createRequest(
			"get",
			$this->commentEndPoint . $articleId
		);
		$request->getEmitter()->on(
			"complete",
			function($e) use (&$comments, $articleId, $loggerService){
				$loggerService->logTaskTime("services/Comment createComments()", function() use ($e, &$comments, $articleId) {
					$this->createComments($e->getResponse()->json(), $comments, $articleId);
				});
			}
		);
		return $request;
	}

	private function createComments($commentsAsArray, &$comments, $articleId){
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
	}


}