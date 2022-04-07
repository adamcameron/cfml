<cfscript>
// test.cfm

strings = ["tahi","rua","toru","wha"];
baseObjects = [new BaseObject(),new BaseObject(),new BaseObject(),new BaseObject()];
baseObjects = [createObject("BaseObject")];
subObjects = [new SubObject(),new SubObject(),new SubObject(),new SubObject()];
otherObjects = [new OtherObject(),new OtherObject(),new OtherObject(),new OtherObject()];

o = new C();
writeOutput("<h3>Passing array of strings</h3>");
safelyCallMethod(o, "returnArrayOfStrings", {data=strings});
safelyCallMethod(o, "takeArrayOfStrings", {data=strings});

writeOutput("<h3>Passing a single BaseObject</h3>");
safelyCallMethod(o, "returnABaseObject", {data=new BaseObject()});
safelyCallMethod(o, "takeABaseObject", {data=new BaseObject()});

writeOutput("<h3>Passing array of BaseObjects</h3>");
safelyCallMethod(o, "returnArrayOfBaseObjects", {data=baseObjects});
safelyCallMethod(o, "takeArrayOfBaseObjects", {data=baseObjects});

writeOutput("<h3>Passing array of SubObjects</h3>");
safelyCallMethod(o, "returnArrayOfBaseObjects", {data=subObjects});
safelyCallMethod(o, "takeArrayOfBaseObjects", {data=subObjects});

writeOutput("<h3>Passing array of OtherObjects</h3>");
safelyCallMethod(o, "returnArrayOfBaseObjects", {data=otherObjects});
safelyCallMethod(o, "takeArrayOfBaseObjects", {data=otherObjects});



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