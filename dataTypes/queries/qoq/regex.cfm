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

coloursWithOorU = queryExecute(
	"SELECT * FROM colours WHERE mi LIKE :pattern",
	{pattern={value="%[aeiou]+%"}},
	{dbtype="query"}
);

writeDump(var=coloursWithOorU, format="text", metainfo=false);
</cfscript>