<cfscript>
	function structBuild(){
		return arguments;
	}
/**/
	st = structBuild(
		numbers=structBuild(
			one="one",
			two="deux",
			three="san",
			four="vier"
		),
		animals=structBuild(
			cat="ocelot",
			dog="dino",
			monkey="donna",
			marmoset=true
		)
	);

</cfscript>
<cfdump var="#st#">
<cfset a = structFindKey(st, "monkey", "ALL")>
<cfdump var="#a#">
<cfset stParent = structGet("st#listDeleteAt(a[1].path, listLen(a[1].path, '.'), '.')#")>
<cfdump var="#stParent#">
