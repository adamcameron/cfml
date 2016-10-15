<cfscript>
s = fileRead(expandPath("./eval.json"));
o = deserializeJson(s);
writeDump(variables);
</cfscript>