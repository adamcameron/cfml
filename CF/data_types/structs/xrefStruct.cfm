<cfscript>
	sValueToCache = "Cache me";
	stCacheStruct = structNew();
	stCacheStruct.cache = sValueToCache;

	stCache = structNew();
	sMainKey = "foo";
	stCache[sMainKey] = stCacheStruct;

	for (i=1; i le 10; i=i+1){
		stCache[createUuid()] = stCacheStruct;
	}
</cfscript>
<cfdump var="#stCache#">
<cfset stCacheStruct.cache = javacast("null", "")>
<cfdump var="#stCache#">
