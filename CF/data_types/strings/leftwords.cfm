<cfscript>
	function leftWords(s, i){
		var space = findOneOf("!();:,./? ",arguments.s, arguments.i);
		if (space){
			return left(arguments.s, space);
		}else{
			return arguments.s;
		}
	}


	testString = "the,quick,brown fox jumps over the lazy dog.";

	writeOutput(leftWords(testString, 10));
</cfscript>