<!--- evaluateCache.cfm --->
<cfscript>
param name="URL.iterations" type="integer";

for (i=1; i <= URL.iterations; i++){
	application.scopeCaches.evaluate.put(key="variables#i#", value="value #i#");
}
start=getTickCount();
for (i=1; i <= URL.iterations; i++){
	application.scopeCaches.evaluate.get(key="variables#i#");
}
logIt(getTickCount()-start);
</cfscript>