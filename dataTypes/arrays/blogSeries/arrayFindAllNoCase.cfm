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
writeOutput("simple: #arrayLen(arrayFindAllNoCase(data.test, "wha"))#<br />");

// simple value but different case
writeOutput("simpleDifferentCase: #arrayLen(arrayFindAllNoCase(data.test, "WHA"))#<br />");


// one each of an array, struct, object, using the actual value from the array itself
writeOutput("struct: #arrayLen(arrayFindAllNoCase(data.test, data.test[1]))#<br />");
writeOutput("array: #arrayLen(arrayFindAllNoCase(data.test, data.test[2]))#<br />");
writeOutput("object: #arrayLen(arrayFindAllNoCase(data.test, data.test[4]))#<br />");


// test copy by assignment
elementToFind = data.array;
writeOutput("assignment: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");


// test shallow copy
elementToFind = structCopy(data.struct);
writeOutput("shallow: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");


// test duplicate atruct
elementToFind = duplicate(data.struct);
writeOutput("duplicateStruct: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

// test duplicate object
elementToFind = duplicate(data.object);
writeOutput("duplicateObject: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");


// test different struct with same value
elementToFind = {one="tahi"};
writeOutput("equivalentStruct: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

// test different struct with same value, but different case
elementToFind = {one="TAHI"};
writeOutput("equivalentStructDifferentCase: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

// test different struct with same key, different value
elementToFind = {one="ichi"};
writeOutput("differentStructSameKeyDifferentValue: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

// test different struct with different key and value
elementToFind = {seven="ono"};
writeOutput("completelyDifferentStruct: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

// test equivalent array with same values, but different case
elementToFind = ["RUA", "TORU"];
writeOutput("equivalentArrayDifferentCase: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

// test different array
elementToFind = ["whitu", "waru"];
writeOutput("completelyDifferentArray: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

// different object, same value
elementToFind = new Number("rima");
writeOutput("equivalentObject: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

// different object, same value, different case
elementToFind = new Number("RIMA");
writeOutput("equivalentObjectDifferentCase: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

// different object, different value
elementToFind = new Number("iwa");
writeOutput("completelyDifferentObject: #arrayLen(arrayFindAllNoCase(data.test, elementToFind))#<br />");

</cfscript>



<!---
data.array = [
	["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"],
	["Kohi-tātea","Hui-tanguru","Poutū-te-rangi","Paenga-whāwhā","Haratua","Pipiri","Hōngongoi","Here-turi-kōkā","Mahuru","Whiringa-ā-nuku","Whiringa-ā-rangi","Hakihea"]
];
 --->