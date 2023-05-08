// SomeService.cfc
component {

	echo("SomeService pseudoconstructor called<br>")

	function init(required SomeDao someDao inject="api.SomeDao"){
		echo("SomeService init() called<br>")
		variables.someDao = arguments.someDao
		return this
	}

	function getVariables(){
		return variables
	}
}