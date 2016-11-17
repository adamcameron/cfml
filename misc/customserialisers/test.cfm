<cfscript>
o = new C();

a = ["tahi", "rua", "toru", "wha"];

s = o.serialize(a);

writeDump([a,s]);
</cfscript>