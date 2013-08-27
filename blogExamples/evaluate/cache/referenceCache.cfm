<!--- referenceCache.cfm --->
<cfscript>
param name="URL.iterations" type="integer";

for (i=1; i <= URL.iterations; i++){
	application.scopeCaches.reference.put(key="variables#i#", value="value #i#");
}
start=getTickCount();
for (i=1; i <= URL.iterations; i++){
	application.scopeCaches.reference.get(key="variables#i#");
}
writeLog(file="#application.applicationname#_referenceCache", text="Elapsed: #getTickCount()-start#ms");
</cfscript>