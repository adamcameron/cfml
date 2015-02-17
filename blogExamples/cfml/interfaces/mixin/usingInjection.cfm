<cfscript>
o = new UsingInjection();

include "functions.cfm";

o.f = f;

writeOutput(o.f(1));
</cfscript>