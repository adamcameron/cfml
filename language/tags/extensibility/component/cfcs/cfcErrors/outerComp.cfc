<cfcomponent>

	<cffunction name="f1" output="true">
		<cfset f3()>
	</cffunction>
	
	<cffunction name="f" output="true">
		<cfset f1()>
	
	</cffunction>


	<cffunction name="f3" output="true">
		<cfset var o = createObject("component", "innerComp")>
		<cftry>
			<cfset o.f2()>
			<cfcatch>
				<cfdump var="#cfcatch#">
			</cfcatch>
		</cftry>
	</cffunction>

	
</cfcomponent>