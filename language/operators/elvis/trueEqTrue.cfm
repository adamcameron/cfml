<cfscript>
result = ( true == true ) ?: 'SHOULD NOT BE THIS VALUE';

writeOutput(result);
</cfscript>