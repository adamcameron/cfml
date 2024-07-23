<cfparam name="form.paramValue" default="">

<cfset setEncoding("form", "UTF-8")>
<cfoutput>
<form method="post">
<input type="text" name="paramValue" value="#form.paramValue#">
<input type="submit" name="btnSubmit" value="Submit">
</form>
</cfoutput>
<cfif structKeyExists(form, "btnSubmit")>
<cfmail to="adamcameroncoldfusion@gmail.com" from="cameron.adam@gmail.com" subject="Test @ #timeFormat(now(), 'HHMM')#" type="text/plain">
<cfmailparam name="X-IS-CUSTFIRSTNAME" value="#form.paramValue#">
</cfmail>
</cfif>