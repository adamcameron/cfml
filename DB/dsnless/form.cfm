<cfif CGI.request_method eq "POST">
	<cfupdate tablename="numbers" formfields="en,mi">
	<cfinclude template="./cfquery.cfm">
</cfif>


<cfparam name="form.id" default="">
<cfparam name="form.en" default="">
<cfparam name="form.mi" default="">
<form method="post" action="./form.cfm">
<cfoutput>
ID: <input name="id" value="#form.id#"><br>
EN: <input name="en" value="#form.en#"><br>
MI: <input name="mi" value="#form.mi#"><br>
</cfoutput>
<input type="submit" value="Insert">
</form>