<cfcomponent>
	
	<cffunction name="uploadFile">
		<cfargument name="upload" type="string" required="true">	
		<cfargument name="target" type="string" required="true">
		
		<cffile action="upload" destination="#arguments.target#" filefield="#arguments.upload#" nameconflict="makeunique"> 	
	</cffunction>
	
</cfcomponent>