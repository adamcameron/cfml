<cfcomponent>
	<cffunction name="f1" output="false">
		<cfreturn true>
	</cffunction>
	
	<cfdirectory directory="C:\Inetpub\wwwroot\adam_junk\tests\cfcinclude\" action="list" name="incList" filter="fn_*.cfm">
	<cfloop query="incList">
		<cfinclude template="#name#">
	</cfloop>
<!--- 	<cfinclude template="lib.cfm"> --->
</cfcomponent>