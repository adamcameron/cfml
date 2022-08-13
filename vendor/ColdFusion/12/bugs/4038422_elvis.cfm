<cfscript>
result = ( true == true ) ?: 'SHOULD NOT BE THIS VALUE';

writeOutput(result); // but it is
</cfscript>