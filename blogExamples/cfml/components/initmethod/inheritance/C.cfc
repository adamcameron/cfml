// C.cfc
component extends=P initmethod=constructor {

	function init(){
		writeOutput("C.init() ran<br>");
		return this;
	}

	function constructor(){
		super.constructor(argumentCollection=arguments);
		writeOutput("C.constructor() ran<br>");
		return this;
	}
}