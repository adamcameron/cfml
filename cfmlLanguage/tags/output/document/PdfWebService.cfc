<cfcomponent output="false">

	<cffunction name="returnPdf" returntype="string" access="remote" output="false">
		<cfargument name="content" type="string" required="true">
		
		<cfset var binBdf = "">
		<cfdocument format="pdf" name="binPdf">
			<cfoutput>#arguments.content#</cfoutput>
		</cfdocument>

		<cfreturn toString(binPdf)>
	</cffunction>


</cfcomponent>