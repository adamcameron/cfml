<?php
// User.php
namespace me\adamcameron\asyncguzzle\service;

class User {

	protected $app;
	protected $guzzleClient;

	function __construct($userFactory, $guzzleClient){
		$this->userFactory = $userFactory;
		$this->guzzleClient = $guzzleClient;
	}

	function getUser($id){
		$startTime = self::getElapsed("Start");

		$response = $this->guzzleClient->get('http://cf11.local:8511/rest/api/person/' . $id,["future"=>true]);
		self::getElapsed("After async guzzle call", $startTime);

		$response->wait();
		self::getElapsed("After wait() call", $startTime);

		$userAsArray = $response->json();

		$userFactory = $this->userFactory;
		$user = $userFactory($userAsArray["ID"], $userAsArray["FIRSTNAME"], $userAsArray["LASTNAME"]);

		return $user;
	}

	private static function getElapsed($message, $start=-1){
		if ($start == -1){
			$start = time();
		}
		error_log(sprintf("%s: %d", $message, time() - $start));
		return $start;
	}

}