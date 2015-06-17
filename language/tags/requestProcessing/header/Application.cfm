<cfif not reFind("dest\.cfm$", CGI.script_name)> 
	<cfheader statuscode="301" statustext="Moved Permanently">
	<cfheader name="location" value="http://shared.local/cf/cfml/tags/pageProcessing/header/dest.cfm?URL=#CGI.script_name#">
</cfif>