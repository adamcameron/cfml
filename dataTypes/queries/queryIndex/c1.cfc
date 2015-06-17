<cfcomponent>
	<cffunction name="f1" output="true">
		<cfargument name="q">
		
		<cfset var o = createObject("component", "c2")>
		<cfloop query="arguments.q" startrow="3" endrow="8">
			<cfoutput>f1: #arguments.q.currentRow#<br /></cfoutput>
			<cfset o.f2(arguments.q)>
			<hr />
		</cfloop>
		<cfreturn arguments.q>
	</cffunction>


</cfcomponent>