<cfcomponent>

	<cffunction name="viaCfml">
		<cfset var cfcatch = structNew()>
		<cftry>
			<cfset x = 1 / 0>
			Will never see this
			<cfcatch>
				Well that was never gonna work, was it?
			</cfcatch>
		</cftry>
	</cffunction>

	<cfscript>
		function viaScript(){
			var e	= structNew();
			try {
				x = 1 / 0;	
				writeOutput("Will never see this");
			} catch (any e){
				writeOutput("Well that was never gonna work, was it?");
			}	
		}
		
	</cfscript>

	
	<cffunction name="dumpVariables" output="true">
		<cfdump var="#variables#">
	</cffunction>
</cfcomponent>