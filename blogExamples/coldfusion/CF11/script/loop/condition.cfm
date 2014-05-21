<cfscript>
months = queryNew("id,mi,anglicised,en", "integer,varchar,varchar,varchar", [
	[1,"Pipiri","Hune","June"],
	[2,"Hōngongoi","Hūrae","July"],
	[3,"Here-turi-kōkā","Akuhata","August"],
	[4,"Mahuru","Hepetema","September"],
	[5,"Whiringa-ā-nuku","Oketopa","October"],
	[6,"Whiringa-ā-rangi","Noema","November"],
	[7,"Hakihea","Tihema","December"],
	[8,"Kohi-tātea","Hānuere","January"],
	[9,"Hui-tanguru","Pēpuere","February"],
	[10,"Poutū-te-rangi","Maehe","March"],
	[11,"Paenga-whāwhā","Āperira","April"],
	[12,"Haratua","Mei","May"]
]);
row=1;
cfloop(condition="row LE 6"){
	rowData = queryGetRow(months,row);
	writeOutput("#row#: #rowData.mi# #rowData.anglicised# (#rowData.en#)<br>");
	row++;
}
</cfscript>