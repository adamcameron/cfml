<cfset message = "before">
<cfoutput>
#message#<br>
<cfinclude template="code.inc">
<cfset message = "after">
#message#<br>
</cfoutput>