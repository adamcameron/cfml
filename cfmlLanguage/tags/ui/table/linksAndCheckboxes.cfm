<cfscript>
	qData = queryNew("id,label,status");
	queryAddRow(qData); qData.id[1] = 1; qData.label[1] = "Item 1"; qData.status[1] = true;
	queryAddRow(qData); qData.id[2] = 2; qData.label[2] = "Item 2"; qData.status[2] = false;
	queryAddRow(qData); qData.id[3] = 3; qData.label[3] = "Item 3"; qData.status[3] = true;
</cfscript>

<form method="post" name="frm">
<cftable border="1" headerlines="true" htmltable="true" query="qData">
	<cfcol text='<a href="./action.cfm?id=#id#">#label#</a>' header="Label">
	<cfcol text='<input type="checkbox" name="status" value="#id#"#iif(status, de(' checked=""checked""'), de(''))# />' header="Status">
</cftable>
<input type="submit" name="btnSubmit" value="Go &raquo;" />
</form>

