<cfscript>
	myQuery = queryNew("ticket_id,description");
	queryAddRow(myQuery);
	querySetCell(myQuery,"ticket_id","1");
	querySetCell(myQuery,"description","a;");
	queryAddRow(myQuery);
	querySetCell(myQuery,"ticket_id","2");
	querySetCell(myQuery,"description","a;b");
</cfscript>

<cfform name="test" action="#cgi.script_name#">
	<cfgrid name="testGrid" query="myQuery" selectmode="ROW" format="FLASH">
	</cfgrid>
	<cfinput type="submit" name="submit" />
</cfform>