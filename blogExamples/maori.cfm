<cfscript>
rainbow	= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"]
numbers = ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"]
week = ["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"]

week = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"Monday","Rāhina"],
	[2,"Tuesday","Rātū"],
	[3,"Wednesday","Rāapa"],
	[4,"Thursday","Rāpare"],
	[5,"Friday","Rāmere"],
	[6,"Saturday","Rāhoroi"],
	[7,"Sunday","Rātapu"]
])
numbers = queryNew("id,en,mi", "integer,varchar,varchar", [
	[1,"one","tahi"],
	[2,"two","rua"],
	[3,"three","toru"],
	[4,"four","wha"],
	[5,"five","rima"],
	[6,"six","ono"],
	[7,"seven","whitu"],
	[8,"eight","ware"],
	[9,"nine","iwa"],
	[10,"ten","tekau"]
])

</cfscript>