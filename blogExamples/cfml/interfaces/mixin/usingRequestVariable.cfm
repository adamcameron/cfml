<cfscript>
request.functions = "functions.cfm";
o = new UsingRequestVariable();
writeOutput(o.f(1));
</cfscript>