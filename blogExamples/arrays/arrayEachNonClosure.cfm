<cfscript>
a = ["Tahi","Rua","Toru","Wha","Rima","Ono","Whitu","Waru","Iwa","Tekau"];

void function eachHandler(element){
	param name="i" default=1;
	writeOutput("#i++# #uCase(element)#<br />");
}

arrayEach(a, eachHandler);
</cfscript>