<cfscript>
	q = queryNew("id,min,max,title,body", "integer,integer,integer,varchar,varchar");
	queryAddRow(q); querySetCell(q, "id", 1); querySetCell(q, "min", 1); querySetCell(q, "max", 200); querySetCell(q, "title", "title of first record"); querySetCell(q, "body", "body of first record");
	queryAddRow(q); querySetCell(q, "id", 2); querySetCell(q, "min", 100); querySetCell(q, "max", 300); querySetCell(q, "title", "title of second record"); querySetCell(q, "body", "body of second record");
	queryAddRow(q); querySetCell(q, "id", 3); querySetCell(q, "min", 1000); querySetCell(q, "max", 1000); querySetCell(q, "title", "title of third record"); querySetCell(q, "body", "body of third record");
	queryAddRow(q); querySetCell(q, "id", 4); querySetCell(q, "min", 20); querySetCell(q, "max", 1000); querySetCell(q, "title", "title of fourth record"); querySetCell(q, "body", "body of fourth record");
	queryAddRow(q); querySetCell(q, "id", 5); querySetCell(q, "min", 220); querySetCell(q, "max", 700); querySetCell(q, "title", "title of fifth record"); querySetCell(q, "body", "body of fifth record");
</cfscript>


<cfindex
	collection	= "#sCollectionName#"
	action		= "refresh"
	type		= "custom"
	query		= "q"
	key			= "id"
	custom1		= "min"
	custom2		= "max"
	title		= "title"
	body		= "body"
>