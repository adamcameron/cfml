<?php
// Article.php

namespace dac\guzzledemo\services;

class Article {

	protected $app;
	protected $guzzleClient;
	protected $loggerService;

	function __construct($articleFactory, $guzzleClient, $loggerService){
		$this->articleFactory	= $articleFactory;
		$this->guzzleClient		= $guzzleClient;
		$this->loggerService	= $loggerService;
	}

	function getArticle($id, &$article){
		$loggerService = $this->loggerService;
		$loggerService->getElapsed("services/Article getArticle(): start");

		$response = $this->guzzleClient->get(
			'http://cf11.local:8511/rest/blog/article/' . $id,
			[
				"config"	=> [
					"curl"	=> [CURLOPT_PROXY => ""]
				],
				"future"=>true
			]
		);
/*
		$request = $this->guzzleClient->createRequest('GET', 'http://cf11.local:8511/rest/blog/article/' . $id, [
			"config"	=> [
				"curl"	=> [CURLOPT_PROXY => ""]
			],
			"future"=>true
		]);
		$response = $this->guzzleClient->send($request);
*/
		

		$loggerService->getElapsed("services/Article getArticle(): After get()");

		$response->then(function($response) use (&$article, $loggerService) {
			$loggerService->getElapsed("services/Article getArticle(): top of then()");
			$articleAsArray = $response->json();

			$articleFactory = $this->articleFactory;
			$article = $articleFactory(
				$articleAsArray["ID"],
				$articleAsArray["DATE"],
				$articleAsArray["TITLE"],
				$articleAsArray["BODY"]
			);

			return $response;
		});
		$loggerService->getElapsed("services/Article getArticle(): bottom");
		return $response;
	}


}