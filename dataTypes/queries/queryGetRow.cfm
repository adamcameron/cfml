<cfscript>
// queryGetRow.cfm
json = '{"COLUMNS":["ID","COL with ## in name"],"DATA":[[1,"tahi"],[2,"rua"],[3,"toru"],[4,"wha"]]}';
records = deserializeJson(json, false);
writeDump(records);

row = queryGetRow(records, 1, true);
writeDump(row);
</cfscript>