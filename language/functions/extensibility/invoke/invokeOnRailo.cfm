<cfscript>
// invokeOnRailo.cfm

test = new Test();

methodToCall = "f";

writeOutput("<h3>invoke() with name/value pairs</h3>");
invoke(test, methodToCall, {one="tahi", two="rua", three="toru", four="wha"});

writeOutput("<h3>invoke() with ordered arguments</h3>");
invoke(test, methodToCall, ["tahi","rua","toru","wha"]);

</cfscript>