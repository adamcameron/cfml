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

cfloop(query=week, startrow=2, endrow=4){
	writeOutput("#id#: #mi# (#en#)<br>");
}	
</cfscript>