<cfif structKeyExists(form, "btnSubmit")>
	<cfhttp url="#form.URL#" method="get" throwonerror="true" timeout="30" redirect="true" resolveurl="true" result="stHttp" />
	<cfcontent reset="true"><cfoutput>#stHttp.fileContent#</cfoutput>
</cfif>
