<cfdirectory directory="C:\Inetpub\wwwroot\adam_junk\tests\cfcinclude\" action="list" name="incList" filter="fn_*.cfm">
<cfloop query="incList">
	<cfinclude template="#name#">
</cfloop>
