<cfscript>
// test.cfm

strings = ["tahi","rua","toru","wha"];
baseObjects = [new BaseObject(),new BaseObject(),new BaseObject(),new BaseObject()];
baseObjects = [createObject("BaseObject")];
subObjects = [new SubObject(),new SubObject(),new SubObject(),new SubObject()];
otherObjects = [new OtherObject(),new OtherObject(),new OtherObject(),new OtherObject()];

o = new C();
writeOutput("<h3>Passing array of strings</h3>");
safelyCallMethod(o, "returnArrayOfStrings", strings);
safelyCallMethod(o, "takeArrayOfStrings", strings);

writeOutput("<h3>Passing array of BaseObjects</h3>");
safelyCallMethod(o, "returnArrayOfBaseObjects", baseObjects);
safelyCallMethod(o, "takeArrayOfBaseObjects", baseObjects);

writeOutput("<h3>Passing array of SubObjects</h3>");
safelyCallMethod(o, "returnArrayOfBaseObjects", subObjects);
safelyCallMethod(o, "takeArrayOfBaseObjects", subObjects);

writeOutput("<h3>Passing array of OtherObjects</h3>");
safelyCallMethod(o, "returnArrayOfBaseObjects", otherObjects);
safelyCallMethod(o, "takeArrayOfBaseObjects", otherObjects);



function safelyCallMethod(required obj, required string method, args={}){
	writeOutput("<h4>Calling #method#()</h4>");
	try {
		invoke(obj, method, args);
	}catch (any e){
		writeOutput("#e.type# #e.message# #e.detail#<br>");
	}
	writeOutput("<hr>");
}
</cfscript>