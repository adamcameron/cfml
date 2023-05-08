<cfprocessingdirective pageEncoding="utf-8">
<cfscript>

week = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"Monday","Rāhina"],
	[2,"Tuesday","Rātū"],
	[3,"Wednesday","Rāapa"],
	[4,"Thursday","Rāpare"],
	[5,"Friday","Rāmere"],
	[6,"Saturday","Rāhoroi"],
	[7,"Sunday","Rātapu"]
]);

shortestMaoriDayName = week.reduce(function(shortest,number){
	if (shortest.len() == 0) return number.mi;
	return number.mi.len() < shortest.len() ? number.mi : shortest;
}, "");

CLI.writeLn(shortestMaoriDayName);
</cfscript>