<cffunction name="testInt" returntype="java.lang.Number">
	<cfargument name="integer" type="java.lang.Number">
	<cfreturn arguments.integer / 2>
</cffunction>

<cfoutput>
<cftry>
	#testInt(integer=javaCast("int",2))#
	<cfcatch>testInt(2) failed</cfcatch>
</cftry>
<hr />

<cftry>
	#testInt(integer=3)#
	<cfcatch>testInt(3) failed</cfcatch>
</cftry>
<hr />

<cftry>
	#testInt(integer=3.5)#
	<cfcatch>testInt(3.5) failed</cfcatch>
</cftry>
<hr />

</cfoutput>