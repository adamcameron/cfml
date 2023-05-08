<cfcomponent>
<cfscript>
	variables.maori		= listToArray("tahi,rua,toru,wha");
	variables.english	= listToArray("one,two,three,four");

	function inMaori(number){
		return variables.maori[number];
	}

	function inEnglish(number){
		return variables.english[number];
	}
</cfscript>	
</cfcomponent>