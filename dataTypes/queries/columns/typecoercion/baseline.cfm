<cfscript>
include "../../../../safeRun.cfm";

week = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"Monday","Rāhina"],
	[2,"Tuesday","Rātū"],
	[3,"Wednesday","Rāapa"],
	[4,"Thursday","Rāpare"],
	[5,"Friday","Rāmere"],
	[6,"Saturday","Rāhoroi"],
	[7,"Sunday","Rātapu"]
]);
safeRun("Query:", function(){
	writeDump(week);
});

safeRun("Column via dot:", function(){
	writeDump(week.mi);
});

safeRun("Column via array:", function(){
	writeDump(week["mi"]);
});

safeRun("Type:", function(){
	writeOutput("#week["mi"].getClass().getName()#<br>");
});

safeRun(".toString():", function(){
	writeOutput("#week["mi"].toString()#<br>");
});


safeRun("toString():", function(){
	writeOutput("#toString(week["mi"])#<br>");
});

safeRun("writeOutput():", function(){
	writeOutput("#week["mi"]#<br>");
});
</cfscript>