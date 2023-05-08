<cfscript>
struct function getTestData(){
	var data = {};
	data.struct	= {one="tahi"};
	data.array	= ["rua", "toru"];
	data.simple	= "wha";
	
	data.test = [
		data.struct,
		data.array,
		data.simple
	];
	return data;
}

string function ok(array){
	return arrayLen(array) == 3 ? "DELETED" : "NOT DELETED";
}


data = getTestData();
arrayDelete(data.test, "WHA");
writeOutput("Delete simple value, different case: #ok(data.test)#<br />");


data = getTestData();
elementToFind = {one="TAHI"};
arrayDelete(data.test, elementToFind);
writeOutput("Delete equivalent struct with different-cased key: #ok(data.test)#<br />");



data = getTestData();
elementToFind = ["RUA", "TORU"];
arrayDelete(data.test, elementToFind);
writeOutput("Delete equivalent array with different case: #ok(data.test)#<br />");
</cfscript>