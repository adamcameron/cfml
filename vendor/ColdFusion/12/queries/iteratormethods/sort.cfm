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

sortedColours = colours.sort(function(c1,c2){
	writeDump(c1);
	abort;
	return compare(c1.mi, c2.mi);
});

writeDump(sortedColours);
</cfscript>