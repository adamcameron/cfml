<cfscript>
d = now();
writeDump([d]);

d.add("d", 1);
writeDump([d]);

d = d.add("d", 1);
writeDump([d]);
</cfscript>