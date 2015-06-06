<cfcomponent>

	<cffunction name="f">
		<cfset g()>
	</cffunction>

	<cffunction name="g" access="private" returntype="void">
		<cfset var sUrl = "./getPageContextTarget.cfm?method=dispatch&cf_request=/section/home/0">
		<cfset getPageContext().forward(sUrl)>
		<cfabort>
	</cffunction>

</cfcomponent>