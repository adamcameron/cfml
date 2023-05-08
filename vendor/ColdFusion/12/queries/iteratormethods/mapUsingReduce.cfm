<cfscript>
colours = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"red","whero"],
	[2,"orange","karaka"],
	[3,"yellow","kowhai"],
	[4,"green","kakariki"],
	[5,"blue","kikorangi"],
	[6,"indigo","poropango"],
	[10,"violet","papura"]
]);

maoriColours = colours.reduce(function(maoriColours, colour, index, colours){
	maoriColours.addRow();
	colour.each(function(column, value){
		if (!maoriColours.columnList.listFindNoCase(column)){
			maoriColours.addColumn(column, "varchar", []);
		}
		maoriColours.setCell(column, value);
	});
	return maoriColours;
}, queryNew(""));	

writeDump(var=maoriColours);

</cfscript>