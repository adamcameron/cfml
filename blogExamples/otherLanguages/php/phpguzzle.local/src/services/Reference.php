<?php
// Reference.php

namespace dac\guzzledemo\services;

class Reference {

	protected $app;
	protected $guzzleClient;
	protected $loggerService;

	function __construct($referenceFactory, $guzzleClient, $loggerService){
		$this->referenceFactory	= $referenceFactory;
		$this->guzzleClient		= $guzzleClient;
		$this->loggerService	= $loggerService;
	}

	function getReferencesForArticle($articleId, &$references){
		$loggerService = $this->loggerService;
		$loggerService->getElapsed("services/Reference getReferencesForArticle(): start");

		$response = $this->guzzleClient->get('http://cf11.local:8511/rest/blog/reference/articleId/' . $articleId, ["future"=>true]);
		$loggerService->getElapsed("services/Reference getReferencesForArticle(): After get()");

		$response->then(function($response) use (&$references, $loggerService, $articleId) {
			$loggerService->getElapsed("services/Reference getReferencesForArticle(): top of then()");
			$referencesAsArray = $response->json();

			$referenceFactory = $this->referenceFactory;
			foreach ($referencesAsArray as $referenceAsArray){
				$references[] = $referenceFactory(
					$referenceAsArray["ID"],
					$articleId,
					$referenceAsArray["TITLE"],
					$referenceAsArray["LINK"]
				);
			}

			return $response;
		});
		$loggerService->getElapsed("services/Reference getReferencesForArticle(): bottom");
		return $response;
	}

}
