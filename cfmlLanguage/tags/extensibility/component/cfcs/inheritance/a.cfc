<cfcomponent>
	A.CFC<br />
	<cfdump var="#getMetaData()#" label="a.cfc constructor">
	<cfset f("f() call from a.cfc constructor")>
	<cffunction name="f">
		<cfdump var="#getMetaData()#" label="#arguments[1]#">
	</cffunction>
</cfcomponent>