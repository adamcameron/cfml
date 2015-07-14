<cfscript>
// nestedViaComponent.cfm

writeLog(file="nestedViaComponent01", text="Top of nestedViaComponent.cfm ");
thread name="t1" action="run" {
	sleep(1000);
	new NestedViaComponent().doAThread();
	writeLog(file="nestedViaComponent01", text="Bottom of t1");
}
writeLog(file="nestedViaComponent01", text="Bottom of nestedViaComponent.cfm");
</cfscript>