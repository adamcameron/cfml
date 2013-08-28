component {

	this.name = "evaluatePerformance061";

	function onApplicationStart(){
		include "./createTestVariables.cfm";
		//application.numbers = new Numbers();
	}

	function onRequestStart(){
		include "../lib/udfs.cfm";
	}

	function onRequest(){
		include arguments[1];
	}

}