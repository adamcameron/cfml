// FinalArguments.cfc
component {

	function f(final string x){
		x = "something else"
		echo(x)
	}

}