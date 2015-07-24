<cfscript>
// multiple.cfm

a = 17;
b = 19;
c = 23;

a += (b += c);

writeDump(variables);
</cfscript>