<cfscript>
// headeredtable.cfm

if (thistag.hasClosingTag){
	throw;
}

param query attributes.records;

if (!structKeyExists(attributes, "columnMap")){
	attributes.columnMap = getMetadata(attributes.records).reduce(function(map, column){
		map.append({column=column.columnName, label = column.columnName});
	}, []);
}
</cfscript>
<table>
</table>