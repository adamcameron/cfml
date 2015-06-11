<cfcomponent output="false">

	<cffunction name="render" output="true" access="public" hint="Testing if this is still an OK function name in CF8">
		<cfoutput>Output from <em>render()</em> method<br /></cfoutput>
	</cffunction>

	<cffunction name="callRender" output="true" access="public" hint="Wrapper method">
		<cfoutput>
			Output from <em>callerRender()</em> method<br />
			<cfset render()>
			Output from <em>callerRender()</em> method<br />
		</cfoutput>
	</cffunction>

</cfcomponent>