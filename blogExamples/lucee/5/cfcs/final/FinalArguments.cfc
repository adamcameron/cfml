// FinalArguments.cfc
component {

	function f(final string f){
		arguments.f = "something else"
		echo(arguments.f)
	}

}