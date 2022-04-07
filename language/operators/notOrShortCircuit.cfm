<cfset variables.email = "x@email.com">
<cfif NOT structKeyExists(variables, "email") OR isValid("email", variables.email)>
	GOOD
<cfelse>	
	BAD
</cfif> 