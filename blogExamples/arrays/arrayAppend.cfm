<cfscript>
a1 = ["one", "two", "three", "four"];
a2 = ["tahi", "rua", "toru", "wha"];


arrayAppend(a1, a2);
writeDump(var=a1, label="The contents of a2 become a single element of a1");

a1 = ["one", "two", "three", "four"];
a2 = arrayNew(1);
a2[2] = "Rua";

arrayAppend(a1, a2, true);
writeDump(var=a1, label="The contents of a2 are individually added to a1");
</cfscript>