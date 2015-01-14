<?php
// Article.php

namespace dac\guzzledemo\controllers;

class Article {

	protected $twig;
	protected $articleService;
	protected $guzzleClient;

	function __construct($twig, $articleService, $referenceService, $commentService, $loggerService, $guzzleClient){
		$this->twig				= $twig;
		$this->articleService	= $articleService;
		$this->referenceService	= $referenceService;
		$this->commentService	= $commentService;
		$this->loggerService	= $loggerService;
		$this->guzzleClient		= $guzzleClient;
	}

	function getArticle($id){
		$this->loggerService->getElapsed("controllers/article getArticle(): start");
		$this->loggerService->getElapsed("controllers/article getArticle(): start");
		$article = [];
		$articleResponse = $this->articleService->getArticle($id, $article);
		$this->loggerService->getElapsed("controllers/article getArticle(): after getArticles()");

		$references = [];
		$referencesResponse = $this->referenceService->getReferencesForArticle($id, $references);		
		$this->loggerService->getElapsed("controllers/article getArticle(): after getReferencesForArticle()");

		$comments = [];
		$commentsResponse = $this->commentService->getCommentsForArticle($id, $comments);		
		$this->loggerService->getElapsed("controllers/article getArticle(): after getCommentsForArticle()");


		$this->loggerService->getElapsed("controllers/article getArticle(): before sleep()");
		sleep(2);
		$this->loggerService->getElapsed("controllers/article getArticle(): after sleep()");

		$this->loggerService->getElapsed("controllers/article getArticle(): before first wait()");
		$articleResponse->wait();
		$this->loggerService->getElapsed("controllers/article getArticle(): after first wait()");
		$this->loggerService->getElapsed("controllers/article getArticle(): before second wait()");
		$referencesResponse->wait();
		$this->loggerService->getElapsed("controllers/article getArticle(): after second wait()");
		$this->loggerService->getElapsed("controllers/article getArticle(): before third wait()");
		$commentsResponse->wait();
		$this->loggerService->getElapsed("controllers/article getArticle(): after third wait()");

		return $this->twig->render('article.html.twig', array(
			'article' => $article,
			'references' => $references,
			'comments' => $comments
		));
	}

	function getArticleViaPool($id){
		$article = [];
		$references = [];
		$comments = [];

		$this->loggerService->logTaskTime("==============================", function() use ($id, &$article, &$references, &$comments) {
			$logSource = "controllers/article getArticleViaPool()";

			$requests = [];

			$this->loggerService->logTaskTime("$logSource: create requests", function() use (&$requests, $id, &$article, &$references, &$comments) {
				$requests[] = $this->articleService->getArticleRequest($id, $article);
				$requests[] = $this->referenceService->getReferencesRequest($id, $references);
				$requests[] = $this->commentService->getCommentsRequest($id, $comments);
			});

			$pool = null;
			$this->loggerService->logTaskTime("$logSource: run pooled requests", function() use (&$pool, &$requests, $id, &$article, &$references, &$comments) {
				$pool = new \GuzzleHttp\Pool($this->guzzleClient, $requests);
			});

			$this->loggerService->logTaskTime("$logSource: wait for pooled requests", function() use ($pool) {
				$pool->wait();	
			});
		});
		return $this->twig->render('article.html.twig', [
			'article' => $article,
			'references' => $references,
			'comments' => $comments
		]);
	}
		
}