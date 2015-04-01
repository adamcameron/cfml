<cfscript>
// usingRuntimeMixin.cfm

o = new UsingRuntimeMixin("functions.cfm");
writeOutput(o.f(1));
</cfscript>