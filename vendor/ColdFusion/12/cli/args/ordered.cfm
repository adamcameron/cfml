<cfscript>
writeDump(var=CLI.getArgs(), label="All arguments");
CLI.writeLn("");
CLI.writeLn("First argument: " & CLI.getArg(1));
</cfscript>