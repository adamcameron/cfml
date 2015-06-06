<cfscript>
	q = queryNew("");
	queryAddColumn(q, "id", "Integer", [1,2,3,4,5]);
	queryAddColumn(q, "firstName", "VarChar", ["Adam", "Belinda", "Chuck", "Donna", "Ed"]);
	queryAddColumn(q, "lastName", "VarChar", ["Anderson", "Brown", "Cameron", "Dean", "Evans"]);
	writeDump(q);
</cfscript>