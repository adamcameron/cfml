<cfscript>
result = URL.condition ? directoryCreate("C:\temp\dir3") : javaCast("null", "");
writeDump(variables);
</cfscript>