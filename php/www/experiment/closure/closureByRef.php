<?php

class TestCallback {

	protected $callback;

	function __construct($callback){
		$this->callback = $callback;
	}

	function callViaIntermediary(){
		// this two-step works
		$callback = $this->callback; 
		$callback("intermediary");
	}

	function callDirect(){
		// this single step does not
		$this->callback("direct");
	}

	function callViaProxy(){
		call_user_func($this->callback, "proxy");
	}

	function callback(){
		call_user_func($this->callback, "callback");
	}

}


$o = new TestCallback(function($type){
	printf("called via %s<br>", $type);
});


$o->callViaIntermediary(); // this is fine
$o->callViaProxy(); // as is this
$o->callDirect(); // this errors with Fatal error: Call to undefined method TestCallback::callback() on line 17
