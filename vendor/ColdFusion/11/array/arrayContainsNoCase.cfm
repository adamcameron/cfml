<cfscript>
	badneedle		= ["apple"];
	goodneedle		= ["pineapple"];
	haystack		= ["bacon", "cheese", "pineapple"];
	safe(function(){
		badResult		= arrayContainsNoCase(haystack, badNeedle);
		writeOutput("badResult: #badResult#<br>");	
	});
	safe(function(){
		goodResult		= arrayContainsNoCase(haystack, goodNeedle);
		writeOutput("goodResult: #goodResult#<br>");	
	});
	safe(function(){
		goodResult		= haystack.containsNoCase(goodNeedle);
		writeOutput("goodResult via mwmbr function: #goodResult#<br>");	
	});
	writeDump(variables);

	function safe(f){
		try {
			f();
		}catch(any e){
			writeOutput("[#e.type#] #e.message# (#e.detail#)<br>");
		}
	}

</cfscript>