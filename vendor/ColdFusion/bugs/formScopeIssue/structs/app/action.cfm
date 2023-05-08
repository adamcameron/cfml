<cfoutput>Top of #getFileFromPath(getCurrentTemplatePath())#<br /></cfoutput>
<cfif structKeyExists(form, "redirect") AND form.redirect>
	<cfheader statuscode="301" statustext="Moved Permanently">
	<cfheader name="Location" value="http://www.scribble.local/blog/structs/app/redirected.cfm">
<cfelse>
	<cfinclude template="dumps.cfm">
</cfif>
<cfoutput>Bottom of #getFileFromPath(getCurrentTemplatePath())#<br /></cfoutput>