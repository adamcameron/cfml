<cfset loopCount = 1>

<cfif cgi.REQUEST_METHOD eq "post">
	<cfset local = structNew()>
	<cfset structAppend(local,form)>
	
	<cfoutput>
		isDefined("filter_#loopCount#"): [#isDefined("filter_#loopCount#")#]<br />
		isDefined("form.filter_#loopCount#"): [#isDefined("form.filter_#loopCount#")#]<br />
		isDefined("local.filter_#loopCount#"): [#isDefined("local.filter_#loopCount#")#]<br />
		structKeyExists(form, "filter_#loopCount#"): [#structKeyExists(form, "filter_#loopCount#")#]<br />
		structKeyExists(local, "filter_#loopCount#"): [#structKeyExists(local, "filter_#loopCount#")#]<br />
		<br /><br />
	</cfoutput>
	<cfdump var="#local#" label="local"> 
	<cfdump var="#form#" label="form">
	<br /><br />
</cfif>
<cfoutput>
	<form action="#CGI.script_name#" method="post">
		<input type="text" name="filter_#loopCount#" value="" />
		<input type="submit" name="btnSubmit" value="Submit" />
	</form>
</cfoutput>