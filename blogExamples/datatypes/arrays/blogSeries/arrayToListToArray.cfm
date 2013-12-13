<cfscript>
a1 = ["tahi", "rua", "toru", "wha"];
a1 = [];
a1[1] = "tahi";
a1[3] = "toru";
a1[5] = "rima";

l = arrayToList(a1);
a2 = listToArray(l);
writeDump(variables);
</cfscript>