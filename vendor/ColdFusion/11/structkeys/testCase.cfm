<cfscript>
server.lowercase = true;
server.UPPERCASE = true;
server.mixedCase = true;
json = serializeJson(server);
cf = deserializeJson(json);
writeDump(var=[{original=server},{json=json},{deserailised=cf}], label="server scope");
writeOutput("<hr>");

application.lowercase = true;
application.UPPERCASE = true;
application.mixedCase = true;
json = serializeJson(application);
cf = deserializeJson(json);
writeDump(var=[{original=application},{json=json},{deserailised=cf}], label="application scope");
writeOutput("<hr>");

session.lowercase = true;
session.UPPERCASE = true;
session.mixedCase = true;
json = serializeJson(session);
cf = deserializeJson(json);
writeDump(var=[{original=session},{json=json},{deserailised=cf}], label="session scope");
writeOutput("<hr>");

request.lowercase = true;
request.UPPERCASE = true;
request.mixedCase = true;
json = serializeJson(request);
cf = deserializeJson(json);
writeDump(var=[{original=request},{json=json},{deserailised=cf}], label="request scope");
writeOutput("<hr>");

structClear(variables);
variables.lowercase = true;
variables.UPPERCASE = true;
variables.mixedCase = true;
json = serializeJson(variables);
cf = deserializeJson(json);
writeDump(var=[{original=variables},{json=json},{deserailised=cf}], label="variables scope");
writeOutput("<hr>");

dotNotation = {};
dotNotation.lowercase = true;
dotNotation.UPPERCASE = true;
dotNotation.mixedCase = true;
json = serializeJson(dotNotation);
cf = deserializeJson(json);
writeDump(var=[{original=dotNotation},{json=json},{deserailised=cf}], label="struct with dot notation");
writeOutput("<hr>");

literalNotation = {
	lowercase = true,
	UPPERCASE = true,
	mixedCase = true
};
json = serializeJson(literalNotation);
cf = deserializeJson(json);
writeDump(var=[{original=literalNotation},{json=json},{deserailised=cf}], label="struct with literal notation");
writeOutput("<hr>");

viaStructInsert = structNew();
structInsert(viaStructInsert, "lowercase", true);
structInsert(viaStructInsert, "UPPERCASE", true);
structInsert(viaStructInsert, "mixedCase", true);
json = serializeJson(viaStructInsert);
cf = deserializeJson(json);
writeDump(var=[{original=viaStructInsert},{json=json},{deserailised=cf}], label="struct via structInsert()");
writeOutput("<hr>");
</cfscript>