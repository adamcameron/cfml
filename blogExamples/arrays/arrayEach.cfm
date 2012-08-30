<cfscript>
a = ["Tahi","Rua","Toru","Wha","Rima","Ono","Whitu","Waru","Iwa","Tekau"];

arrayEach(
	a,
	function(element){
		param name="i" default=1;
		writeOutput("#i++# #uCase(element)#<br />");
	}
);
</cfscript>