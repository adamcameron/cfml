<cfscript>
struct function getTestData(){
	var data = {};
	data.struct	= {one="tahi"};
	data.array	= ["rua", "toru"];
	data.simple	= "wha";
	data.object	= new Object("rima");
	
	data.test = [
		data.struct,
		data.array,
		data.simple,
		data.object
	];
	return data;
}

string function ok(array){
	return arrayLen(array) == 3 ? "DELETED" : "NOT DELETED";
}


// test just a simple value
data = getTestData();
writeDump(var=data, label="Baseline data for all tests");

arrayDelete(data.test, "wha");
writeOutput("Delete simple value: #ok(data.test)#<br />");


// simple value but different case
data = getTestData();
arrayDelete(data.test, "WHA");
writeOutput("Delete simple value, different case: #ok(data.test)#<br />");

// one each of an array, struct, object, using the actual value from the array itself
data = getTestData();
arrayDelete(data.test, data.test[1]);
writeOutput("Delete struct: #ok(data.test)#<br />");

data = getTestData();
arrayDelete(data.test, data.test[2]);
writeOutput("Delete array: #ok(data.test)#<br />");

data = getTestData();
arrayDelete(data.test, data.test[4]);
writeOutput("Delete object: #ok(data.test)#<br />");


// test copy by assignment
data = getTestData();
elementToFind = data.array;
arrayDelete(data.test, elementToFind);
writeOutput("Delete assigned array: #ok(data.test)#<br />");


// test shallow copy
data = getTestData();
elementToFind = structCopy(data.struct);
arrayDelete(data.test, elementToFind);
writeOutput("Delete shallow-copied struct: #ok(data.test)#<br />");


// test duplicate atruct
data = getTestData();
elementToFind = duplicate(data.struct);
arrayDelete(data.test, elementToFind);
writeOutput("Delete duplicated struct: #ok(data.test)#<br />");


// test duplicate object
data = getTestData();
elementToFind = duplicate(data.object);
arrayDelete(data.test, elementToFind);
writeOutput("Delete duplicated object: #ok(data.test)#<br />");



// test different struct with same value
data = getTestData();
elementToFind = {one="tahi"};
arrayDelete(data.test, elementToFind);
writeOutput("Delete equivalent but different struct: #ok(data.test)#<br />");


// test different struct with same value, but different case
data = getTestData();
elementToFind = {one="TAHI"};
arrayDelete(data.test, elementToFind);
writeOutput("Delete equivalent struct with different-cased key: #ok(data.test)#<br />");


// test different struct with same key, different value
data = getTestData();
elementToFind = {one="ichi"};
arrayDelete(data.test, elementToFind);
writeOutput("Delete different struct with different key value: #ok(data.test)#<br />");


// test different struct with different key and value
data = getTestData();
elementToFind = {seven="ono"};
arrayDelete(data.test, elementToFind);
writeOutput("Delete different struct: #ok(data.test)#<br />");


// test equivalent array with same values, but different case
data = getTestData();
elementToFind = ["RUA", "TORU"];
arrayDelete(data.test, elementToFind);
writeOutput("Delete eqivalent array with different case: #ok(data.test)#<br />");



// test different array
data = getTestData();
elementToFind = ["whitu", "waru"];
arrayDelete(data.test, elementToFind);
writeOutput("Delete different array: #ok(data.test)#<br />");


// different object, same value
data = getTestData();
elementToFind = new Object("rima");
arrayDelete(data.test, elementToFind);
writeOutput("Delete different object with same value: #ok(data.test)#<br />");


// different object, same value, different case
data = getTestData();
elementToFind = new Object("RIMA");
arrayDelete(data.test, elementToFind);
writeOutput("Delete different object with same value, different case: #ok(data.test)#<br />");


// different object, different value
data = getTestData();
elementToFind = new Object("iwa");
arrayDelete(data.test, elementToFind);
writeOutput("Delete completely different object: #ok(data.test)#<br />");

</cfscript>



<!---
data.array = [
	["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"],
	["Kohi-tātea","Hui-tanguru","Poutū-te-rangi","Paenga-whāwhā","Haratua","Pipiri","Hōngongoi","Here-turi-kōkā","Mahuru","Whiringa-ā-nuku","Whiringa-ā-rangi","Hakihea"]
];
 --->