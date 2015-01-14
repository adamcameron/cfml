<?php
// Article.php

namespace dac\guzzledemo\services;

class Article {

	protected $guzzleClient;
	protected $loggerService;
	protected $articleEndPoint;

	function __construct($articleFactory, $guzzleClient, $loggerService, $articleEndPoint){
		$this->articleFactory	= $articleFactory;
		$this->guzzleClient		= $guzzleClient;
		$this->loggerService	= $loggerService;
		$this->articleEndPoint	= $articleEndPoint;
	}

	function getArticle($id, &$article){
		$loggerService = $this->loggerService;
		$response = null;

		$loggerService->logTaskTime("services/Article GuzzleClient->get()", function() use (&$response, $id) {
			$response = $this->guzzleClient->get($this->articleEndPoint . $id);
		});

		$response->then(function($response) use (&$article, $loggerService) {
			$loggerService->logTaskTime("services/Article createArticle()", function() use ($response, &$article) {
				$this->createArticle($response->json(), $article);
			});
			return $response;
		});
		return $response;
	}

	function getArticleRequest($id, &$article){
		$loggerService = $this->loggerService;
		$request = $this->guzzleClient->createRequest("get", $this->articleEndPoint . $id);
		$request->getEmitter()->on(
			"complete",
			function($e) use (&$article, $loggerService){
				$loggerService->logTaskTime("services/Article createComments()", function() use ($e, &$article) {
					$this->createArticle($e->getResponse()->json(), $article);
				});
			}
		);
		return $request;
	}

	private function createArticle($articleAsArray, &$article){
		$articleFactory = $this->articleFactory;
		$article = $articleFactory(
			$articleAsArray["ID"],
			$articleAsArray["DATE"],
			$articleAsArray["TITLE"],
			$articleAsArray["BODY"]
		);
	}

}