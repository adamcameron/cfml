<cfscript>
	q = queryNew("name,colour", "varchar,varchar");
	
	queryAddRow(q); querySetCell(q, "name", "Andy"); querySetCell(q, "colour", "red");
	queryAddRow(q); querySetCell(q, "name", "Andy"); querySetCell(q, "colour", "green");
	queryAddRow(q); querySetCell(q, "name", "Andy"); querySetCell(q, "colour", "blue");
	queryAddRow(q); querySetCell(q, "name", "Belinda"); querySetCell(q, "colour", "red");
	queryAddRow(q); querySetCell(q, "name", "Belinda"); querySetCell(q, "colour", "gold");
	queryAddRow(q); querySetCell(q, "name", "Belinda"); querySetCell(q, "colour", "green");
	queryAddRow(q); querySetCell(q, "name", "Charlie"); querySetCell(q, "colour", "red");
	queryAddRow(q); querySetCell(q, "name", "Charlie"); querySetCell(q, "colour", "white");
	queryAddRow(q); querySetCell(q, "name", "Charlie"); querySetCell(q, "colour", "blue");
	queryAddRow(q); querySetCell(q, "name", "Denise"); querySetCell(q, "colour", "cyan");
	queryAddRow(q); querySetCell(q, "name", "Denise"); querySetCell(q, "colour", "magenta");
	queryAddRow(q); querySetCell(q, "name", "Denise"); querySetCell(q, "colour", "yellow");
	queryAddRow(q); querySetCell(q, "name", "Denise"); querySetCell(q, "colour", "black");
	queryAddRow(q); querySetCell(q, "name", "Ed"); querySetCell(q, "colour", "black");
	queryAddRow(q); querySetCell(q, "name", "Ed"); querySetCell(q, "colour", "white");
</cfscript>

<cfform>
	<cfgrid format="html" name="grd1" query="q" groupfield="name" />
</cfform>