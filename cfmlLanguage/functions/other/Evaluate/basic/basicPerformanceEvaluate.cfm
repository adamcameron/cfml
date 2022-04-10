<cfscript>
param name="URL.iterations" type="integer";

tally=0;
start=getTickCount();
for (i=1; i <= URL.iterations; i++){
	tally +=evaluate("application.variable#i#");
}
writeLog(file="#application.applicationname#_evaluate", text="Elapsed: #getTickCount()-start#ms");
</cfscript>