<cfscript>
// exception.cfm
writeOutput(server.lucee.version);

sampleStruct = {key="value"};
writeDump(sampleStruct);

try {
	1/0;
} catch (any e){
	writeDump(e);
	writeOutput("<hr>");
	runSafe("structKeyExists()", function(){
		writeOutput("structKeyExists(): " & structKeyExists(e, "type"));
	});
	runSafe("keyExists()", function(){
		writeOutput(".keyExists(): " & e.keyExists("type"));
	});
	runSafe("isStruct()", function(){
		writeOutput("isStruct(): " & isStruct(e));
	});
	runSafe("param", function(){
		param struct e;
		writeOutput("param: true");
	});
	runSafe("requiresStruct()", function(){
		writeOutput("requiresStruct(): " & requiresStruct(e));
	});
	runSafe("returnsStruct()", function(){
		writeOutput("returnsStruct(): " & isObject(returnsStruct(e)));
	});
	runSafe("duplicate()", function(){
		writeOutput("duplicate(): " & isStruct(duplicate(e)));
	});
}

function requiresStruct(required struct struct){
	return true;
}

struct function returnsStruct(required any struct){
	return struct;
}


function runSafe(message, task){
    writeOutput("<h3>#message#</h3>");
    try {
        task();
    } catch (any e){
        writeOutput("#e.type# #e.message# #e.detail#");
    } finally {
        writeOutput('<hr>');
    }
}
</cfscript>