<cfscript>
	function structBuild(){
		return arguments;
	}

	s = structBuild(top1=structBuild(mid1="mid1",mid2="mid2",mid3="mid3"), top2=structBuild(another=structBuild(findme="here it is!")));
	m = structFindKey(s, "findme");
</cfscript>
<cfdump var="#m#">