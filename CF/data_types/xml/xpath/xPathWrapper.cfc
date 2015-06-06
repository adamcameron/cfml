<cfcomponent output="false">
	<cffunction name="xPathSearch" returntype="xml" output="false">
		<cfargument name="xmlDoc" type="XML" required="true">
		<cfargument name="xPath" type="string" required="true">
		<cfset var result = xmlSearch(arguments.xmlDoc, arguments.xPath)>
		<cfreturn result>
	</cffunction>
</cfcomponent>