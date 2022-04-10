<cfcomponent>
	<cffunction name="f1" output="true">
		comp<br />
		<cfdump var="#getMetaData()#">
		<cfinclude template="inc3.cfm">
		<cfset incf1()>
		<cfreturn true>
	</cffunction>

</cfcomponent>