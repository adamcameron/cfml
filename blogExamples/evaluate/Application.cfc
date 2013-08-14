component {

	this.name = "evaluatePerformance106";

	function onApplicationStart(){
		//include "./createTestVariables.cfm";
		application.numbers = new Numbers();
	}

	function onRequestStart(){
		include "./udfs.cfm";
	}

	function onRequest(){
		include arguments[1];
	}

}