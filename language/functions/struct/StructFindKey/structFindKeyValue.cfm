<cfscript>
	function structBuild(){
		return arguments;
	}

	st = structBuild(people=structBuild("Adam", "Barbara", "Chris", "Donna", "Eric"), colours=structBuild(favourite="green", least="pink"), numbers=structBuild(one="un", two="ni", three="drei"));
	a1 = structFindKey(st, "one", "all");
	a2 = structFindValue(st, "Donna", "all");
</cfscript>

<cfdump var="#variables#">