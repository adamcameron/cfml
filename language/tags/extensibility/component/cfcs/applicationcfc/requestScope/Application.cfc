<cfcomponent>

	<cfset this.Name = "testRequestScope">

	<cffunction name="OnRequestStart">
		<cfset request.iStart = getTickCount()>
		<cfoutput>Timer @ start of request: [#request.iStart#]<br /></cfoutput>
	</cffunction>

	<cffunction name="OnRequestEnd">
		<cfset request.iEnd = getTickCount()>
		<cfoutput>
			Timer @ end of request: [#request.iEnd#]<br />
			Duration of request: [#request.iEnd-request.iStart#]<br />
		</cfoutput>
	</cffunction>

</cfcomponent>