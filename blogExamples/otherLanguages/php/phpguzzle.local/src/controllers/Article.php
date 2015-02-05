<?php
// Article.php

namespace dac\guzzledemo\controllers;

class Article {

	protected $twig;
	protected $articleService;

	function __construct($twig, $articleService, $referenceService, $commentService, $loggerService){
		$this->twig				= $twig;
		$this->articleService	= $articleService;
		$this->referenceService	= $referenceService;
		$this->commentService	= $commentService;
		$this->loggerService	= $loggerService;
	}

	function getArticle($id){
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
		sleep(6);
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

}