<cfscript>
// withStruct.cfm

struct.testKey = "value set in struct";
writeDump(var=struct, label="struct");

writeOutput('<br><div style="padding-left: 20px;">');
copy = structCopy(struct);
writeDump(var=copy, label="initial state of copy of struct");

copy.testKey = "value set in copy";
writeDump(var=copy, label="updated state of copy");
writeOutput('</div><br>');

writeDump(var=struct, label="struct after change made to copy");
</cfscript>