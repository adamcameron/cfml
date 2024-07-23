<cfscript>
function colours(){
	var colours = queryNew("");
	queryAddColumn(colours, "maori", "varchar", ["whero", "ma", "mangu"]);
	queryAddColumn(colours, "english", "varchar", ["red","white","black"]);
	return colours;
}
maoriColours = valueList(colours().maori);
writeOutput(colours().maori);
</cfscript>