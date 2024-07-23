<cfscript>
// test.cfm

o = new C();
result = o.f({key="value"});

writeDump(var=variables, label="test.cfm variables");

</cfscript>
