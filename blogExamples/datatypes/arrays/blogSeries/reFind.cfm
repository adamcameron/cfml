<cfscript>
regex = '<cffunction[^>]+returntype="(struct|array)"[^>]*>';
sample = '<cffunction name="getObjects" returntype="struct" access="public" output="false" hint="Returns the objects as a struct, keyed on ID.">';

matchResult = reFind(regex, sample, 1, true);

writeDump(matchResult);

functionSignature    = mid(sample, matchResult.pos[1], matchResult.len[1]);
returnType            = mid(sample, matchResult.pos[2], matchResult.len[2]);

writeOutput("Function signature: #htmlEditFormat(functionSignature)#<br />");
writeOutput("Return type: #returnType#<br />");	
</cfscript>