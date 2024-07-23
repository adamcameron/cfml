<cfparam name="URL.iterations" type="integer">
<cfscript>
tally=0;
start=getTickCount();
for (i=1; i LE URL.iterations; i=i+1){
	tally = tally + application["variable#i#"];
}
logIt(getTickCount()-start);
</cfscript>