component {

	/**
	* @output false
	*/
	function off(){
		writeOutput("foo");
		include "inc_scriptOutput.cfm";
	}

	/**
	* @output true
	*/
	function on(){
		writeOutput("foo");
		include "inc_scriptOutput.cfm";
	}

	/**
	* @hint not set
	*/
	function neither(){
		writeOutput("foo");
		include "inc_scriptOutput.cfm";
	}

}