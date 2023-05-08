<cfscript>
param name="URL.iterations" type="integer";

tally=0;
start=getTickCount();
for (i=1; i <= URL.iterations; i++){
	tally +=evaluate("application.variable#i#");
}
logIt(getTickCount()-start);
</cfscript>