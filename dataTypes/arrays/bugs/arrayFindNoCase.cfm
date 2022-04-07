<cfscript>
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
writeDump(var=data.test, label="Baseline data");


// test equivalent array with same values, but different case
elementToFind = ["rua", "toru"];
writeOutput("equivalentArrayDifferentCase: #arrayFindNoCase(data.test, elementToFind)#<br />");

// different object, same value, different case
elementToFind = new Object("rima");
writeOutput("equivalentObjectDifferentCase: #arrayFindNoCase(data.test, elementToFind)#<br />");
</cfscript>