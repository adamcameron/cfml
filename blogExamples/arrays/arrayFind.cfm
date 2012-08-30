<cfscript>
data.struct	= {one="tahi"};
data.array	= ["rua", "toru"];
data.simple	= "wha";
data.object	= new Number("rima");

data.test = [
	data.struct,
	data.array,
	data.simple,
	data.object
];
writeDump(var=data.test, label="Baseline data");

// test just a simple value
writeOutput("simple: #arrayFind(data.test, "wha")#<br />");

// simple value but different case
writeOutput("simpleDifferentCase: #arrayFind(data.test, "WHA")#<br />");


// one each of an array, struct, object, using the actual value from the array itself
writeOutput("struct: #arrayFind(data.test, data.test[1])#<br />");
writeOutput("array: #arrayFind(data.test, data.test[2])#<br />");
writeOutput("object: #arrayFind(data.test, data.test[4])#<br />");


// test copy by assignment
elementToFind = data.array;
writeOutput("assignment: #arrayFind(data.test, elementToFind)#<br />");


// test shallow copy
elementToFind = structCopy(data.struct);
writeOutput("shallow: #arrayFind(data.test, elementToFind)#<br />");


// test duplicate atruct
elementToFind = duplicate(data.struct);
writeOutput("duplicateStruct: #arrayFind(data.test, elementToFind)#<br />");

// test duplicate object
elementToFind = duplicate(data.object);
writeOutput("duplicateObject: #arrayFind(data.test, elementToFind)#<br />");


// test different struct with same value
elementToFind = {one="tahi"};
writeOutput("equivalentStruct: #arrayFind(data.test, elementToFind)#<br />");

// test different struct with same value, but different case
elementToFind = {one="TAHI"};
writeOutput("equivalentStructDifferentCase: #arrayFind(data.test, elementToFind)#<br />");

// test different struct with same key, different value
elementToFind = {one="ichi"};
writeOutput("differentStructSameKeyDifferentValue: #arrayFind(data.test, elementToFind)#<br />");

// test different struct with different key and value
elementToFind = {seven="ono"};
writeOutput("completelyDifferentStruct: #arrayFind(data.test, elementToFind)#<br />");

// test equivalent array with same values, but different case
elementToFind = ["RUA", "TORU"];
writeOutput("equivalentArrayDifferentCase: #arrayFind(data.test, elementToFind)#<br />");

// test different array
elementToFind = ["whitu", "waru"];
writeOutput("completelyDifferentArray: #arrayFind(data.test, elementToFind)#<br />");

// different object, same value
elementToFind = new Number("rima");
writeOutput("equivalentObject: #arrayFind(data.test, elementToFind)#<br />");

// different object, same value, different case
elementToFind = new Number("RIMA");
writeOutput("equivalentObjectDifferentCase: #arrayFind(data.test, elementToFind)#<br />");

// different object, different value
elementToFind = new Number("iwa");
writeOutput("completelyDifferentObject: #arrayFind(data.test, elementToFind)#<br />");

</cfscript>



<!---
data.array = [
	["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"],
	["Kohi-tātea","Hui-tanguru","Poutū-te-rangi","Paenga-whāwhā","Haratua","Pipiri","Hōngongoi","Here-turi-kōkā","Mahuru","Whiringa-ā-nuku","Whiringa-ā-rangi","Hakihea"]
];
 --->