<cfscript>
cache = new ScopeCacheEvaluate("application");
cache.put(key="foo", value="bar"); // now cached in application scope
moo = cache.get(key="foo");

writeDump(application);
</cfscript>