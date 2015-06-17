<cfparam name="URL.iterations" type="integer">
<cfscript>
for (i=1; i LE URL.iterations; i=i+1){
	application.scopeCaches.evaluate.put(key="variables#i#", value="value #i#");
}
start=getTickCount();
for (i=1; i LE URL.iterations; i=i+1){
	application.scopeCaches.evaluate.get(key="variables#i#");
}
logIt(getTickCount()-start);
</cfscript>