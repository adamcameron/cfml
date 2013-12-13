<cfscript>
a = ["tahi", "toru", "rua", "wha"];
a = [];
a[1] = "tahi";
a[3] = "rua";
a[4] = "wha";

writeDump(a);

arraySwap(a, 2, 3);
writeDump(a);
</cfscript>