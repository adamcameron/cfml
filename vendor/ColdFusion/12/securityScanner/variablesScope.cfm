<cfscript>
unscopedMessage = "hi";
writeOutput(unscopedMessage);	

variables.scopedMessage = "hi";
writeOutput(variables.scopedMessage);	

variables.messageWithFunction = ucase(variables.scopedMessage);
writeOutput(variables.messageWithFunction);	

variables.messageFollowingGuidance = encodeForHtml(unscopedMessage);
writeOutput(variables.messageFollowingGuidance);	

</cfscript>