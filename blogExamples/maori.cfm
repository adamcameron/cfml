<cfscript>
rainbow	= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
week = ["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"];

week = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"Monday","Rāhina"],
	[2,"Tuesday","Rātū"],
	[3,"Wednesday","Rāapa"],
	[4,"Thursday","Rāpare"],
	[5,"Friday","Rāmere"],
	[6,"Saturday","Rāhoroi"],
	[7,"Sunday","Rātapu"]
]);
</cfscript>