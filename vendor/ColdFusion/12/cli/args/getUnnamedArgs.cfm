<cfscript>
args = CLI.getArgs();
unnamedArgs = CLI.getUnnamedArgs();
namedArgs = CLI.getNamedArgs();
writeDump({
	args=args,
	unnamedArgs=unnamedArgs,
	namedArgs=namedArgs
});
</cfscript>