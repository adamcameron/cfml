<cfscript>
// qoqTrim.cfm
rainbow = queryNew("id,mi,en","integer,varchar,varchar",[
	[1,"whero "," red"],
	[2,"karaka "," orange"],
	[3,"kowhai "," yellow"],
	[4,"kakariki "," green"],
	[5,"kikorangi "," blue"],
	[6,"tawatawa "," purple"],
	[7,"mawhero "," pink"]
]);
/*
middleColours = queryExecute("SELECT id,mi,en FROM rainbow WHERE id BETWEEN ? AND ?",[3,5],{dbtype="query", rainbow=rainbow});
output(middleColours);

red = queryExecute("SELECT id,mi,en FROM rainbow WHERE en = ?",["red"],{dbtype="query", rainbow=rainbow});
output(red);
*/
function output(q){
	var cols = listToArray(q.columnList);
	for (row in q){
		for (col in cols){
			writeOutput("#col#:[#row[col]#]");
		}
		writeOutput("<br>");
	}
	writeOutput("<hr>");
}
</cfscript>

<cfquery name="maoriColours" dbtype="query">
	SELECT	mi
	FROM	rainbow
</cfquery>
<cfset output(maoriColours)>