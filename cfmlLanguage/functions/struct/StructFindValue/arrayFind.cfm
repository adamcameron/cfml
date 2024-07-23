<!--- <cfscript>
	st = {numbers=["one", "rua", "trois", "vier", "go"], colours=["red", "kakariki", "bleu", "schwarz", "shiro"], name={first="Adam", last="Cameron"}};
	a = structFindValue(st, "rua", "all");
</cfscript>
<cfdump var="#st#">
<cfdump var="#a#"> --->

<cfscript>
	function structBuild(){
		return arguments;
	}

	st = structBuild(numbers=listToArray("one,rua,trois,vier,go"), colours=listToArray("red,kakariki,bleu,schwarz,shiro"), name=structBuild(first="Adam", last="Cameron"));
	a = structFindValue(st, "Adam", "all");
</cfscript>
<cfdump var="#st#">
<cfdump var="#a#">