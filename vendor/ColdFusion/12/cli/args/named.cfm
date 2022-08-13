<cfscript>
// named.cfm
writeDump(var=CLI.getNamedArgs(), label="All arguments");
CLI.writeLn("");
CLI.writeLn("'two' argument: " & CLI.getNamedArg("two"));
</cfscript>