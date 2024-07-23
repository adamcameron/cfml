// SomeService.cfc
component {

	echo("SomeService pseudoconstructor called<br>")

	function init(someDao){
		echo("SomeService init() called<br>")
		variables.someDao = arguments.someDao
		return this
	}

	function getVariables(){
		return variables
	}
}