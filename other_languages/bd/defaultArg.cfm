<cffunction name="structMake">
	<cfreturn arguments>
</cffunction>


<cfset	st1 = structMake(arg1="val1", arg2="val2", default=true)>
<cfscript>
		st2 = structMake(arg1="val1", arg2="val2", default=true);
</cfscript>
<cfdump var="#variables#">
