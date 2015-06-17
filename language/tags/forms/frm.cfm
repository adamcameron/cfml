<!--- frm.cfm --->
<cfoutput>
<form method="post" action="#CGI.SCRIPT_NAME#">
	List up to five things:<br>
	<cfloop index="i" from="1" to="5">
		<input type="text" name="thing"><br>
	</cfloop>
	<input type="submit" name="btnSubmit" value="Submit">
</form>
</cfoutput>

<cfdump var="#getPageContext().getRequest().getParameterMap()#" label="getParameterMap()">
<cfdump var="#form#" label="form">