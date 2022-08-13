<cfscript>
exitCode = CLI.getNamedArg("exitCode");
CLI.writeln("WTaF?");
CLI.writeln("exitCode: #exitCode#");
cli.exit(exitCode);
</cfscript>