<cfscript>
	colours = deserializeJson('{"COLUMNS":["ID","MAORI","ENGLISH"],"DATA":[[1,"mangu","black"],[2,"whero","red"],[3,"ma","white"]]}', false);
	
	// add a row with a slash
	queryAddRow(colours);
	querySetCell(colours, "id", 4);
	querySetCell(colours, "maori", "kiko\rangi");
	querySetCell(colours, "english", "bl\ue");
</cfscript>


<cfform method="post" action="#CGI.script_name#" format="html">
	<cfgrid name="grid" query="colours"></cfgrid><br />
	<input type="submit" name="btnSubmit" value="Submit" />
</cfform>