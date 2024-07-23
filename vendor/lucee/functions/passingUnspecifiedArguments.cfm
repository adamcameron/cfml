<cfscript>
// passingUnspecifiedArguments.cfm

function acceptsAdditionalArgs(arg1, arg2){
	dump(arguments);
}

acceptsAdditionalArgs("arg1 value", "arg2 value", "arg3 value", "arg4 value");
</cfscript>