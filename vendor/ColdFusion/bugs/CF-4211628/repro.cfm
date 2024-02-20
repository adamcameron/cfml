<cfscript>
	a = ["a", "b", "c"]
	writeOutput(a.reduce((s="", c) => s &= c.toUpperCase()))
</cfscript>
