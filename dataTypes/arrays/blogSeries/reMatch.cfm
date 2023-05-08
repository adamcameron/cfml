<cfscript>
regex = '"[^"]+"';
sample = '<cffunction name="getObjects" returntype="struct" access="public" output="false" hint="Returns the objects as a struct, keyed on ID.">';

matchResult = reMatch(regex, sample);

writeDump(matchResult);	
</cfscript>