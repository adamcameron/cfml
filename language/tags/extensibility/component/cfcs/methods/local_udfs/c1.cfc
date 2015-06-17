<cfcomponent>
	<cffunction name="m">
		In the method<br />
		<cfscript>
			function u(){
				writeOutput("In the UDF<br />");
			}
		</cfscript>
		<cfoutput>#u()#</cfoutput>
	</cffunction>
</cfcomponent>