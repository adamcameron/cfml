component {

	function ucase(s){
		writeOutput("ucase() method was called<br>");
		return s.toUpperCase();
	}

	function viaUnscoped(s){
		return ucase(s);
	}

	function viaScoped(s){
		return variables.ucase(s);
	}

}