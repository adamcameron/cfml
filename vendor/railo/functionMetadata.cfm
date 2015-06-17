<cfprocessingdirective pageEncoding="utf-8">
<cfscript>
/*
	function tikiOtinga(required string s foo bar moo){
		writeDump(arguments);
	}
*/
	tikiOtinga("Whā tekau mā rua", 42);
	writeDump(getMetadata(tikiOtinga));
</cfscript>

<cffunction name="tikiOtinga">
	<cfargument required="true" type="string" name="s" required="" numeric="" i="">
</cffunction>