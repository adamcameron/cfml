<cfcomponent>

	<cffunction name="restart">
		<cfset stop()>
		<cfset start()>
	</cffunction>

	<cffunction name="start" output="true">
		PARENT STARTED<br />
	</cffunction>

	<cffunction name="stop" output="true">
		PARENT STOPPED<br />
	</cffunction>


</cfcomponent>