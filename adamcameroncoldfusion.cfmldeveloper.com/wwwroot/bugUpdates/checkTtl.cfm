<cfscript>
// checkTtl.cfm
pathToTtlClass = expandPath("./");
javaLoader = createObject("javaloader.JavaLoader").init([pathToTtlClass]);
ttl = javaLoader.create("TTL");
writeOutput(ttl.get());
</cfscript>