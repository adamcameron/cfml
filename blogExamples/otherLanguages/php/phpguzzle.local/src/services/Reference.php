<?php
// Reference.php

namespace dac\guzzledemo\services;

class Reference {

	protected $guzzleClient;
	protected $loggerService;
	protected $referenceEndPoint;

	function __construct($referenceFactory, $guzzleClient, $loggerService, $referenceEndPoint){
		$this->referenceFactory	= $referenceFactory;
		$this->guzzleClient		= $guzzleClient;
		$this->loggerService	= $loggerService;
		$this->referenceEndPoint	= $referenceEndPoint;
	}

	function getReferencesForArticle($articleId, &$references){
		$loggerService = $this->loggerService;

		$response = null;
		$loggerService->logTaskTime("services/Reference GuzzleClient->get()", function() use (&$response, $articleId) {
			$response = $this->guzzleClient->get($this->referenceEndPoint . $articleId);
		});

		$response->then(function($response) use (&$references, $loggerService, $articleId) {
			$loggerService->logTaskTime("services/Reference createReferences()", function() use ($response, &$references, $articleId) {
				$this->createReferences($response->json(), $references, $articleId);
			});
			return $response;
		});

		return $response;
	}

	function getReferencesRequest($articleId, &$references){
		$loggerService = $this->loggerService;
		$request = $this->guzzleClient->createRequest("get", $this->referenceEndPoint . $articleId);
		$request->getEmitter()->on(
			"complete",
			function($e) use (&$references, $articleId, $loggerService){
				$loggerService->logTaskTime("services/Reference createReferences()", function() use ($e, &$references, $articleId) {
					$this->createReferences($e->getResponse()->json(), $references, $articleId);
				});
			}
		);
		return $request;
	}

	private function createReferences($referencesAsArray, &$references, $articleId){
		$referenceFactory = $this->referenceFactory;
		foreach ($referencesAsArray as $referenceAsArray){
			$references[] = $referenceFactory(
				$referenceAsArray["ID"],
				$articleId,
				$referenceAsArray["TITLE"],
				$referenceAsArray["LINK"]
			);
		}
	}

}
