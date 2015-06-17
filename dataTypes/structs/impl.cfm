<cffunction name="f">
	<cfargument name="arg" type="struct">
	<cfreturn arguments.arg>
</cffunction>

<cfscript>
	st = f({key="val"});

</cfscript>
<cfdump var="#st#">