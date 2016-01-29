<cfscript>
someJson = '{"stringValue":"a string", "arrayValue": ["a","b","c"], "booleanValue":true, "numericValue": 42}';
myStruct = deserializeJson(someJson);

writeDump(myStruct);
</cfscript>