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
writeLog(file="#application.applicationname#_evaluateCache", text="Elapsed: #getTickCount()-start#ms");
</cfscript>