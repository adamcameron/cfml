<cfscript>
// baseline.cfm

writeLog(file="baseline01", text="Top of baseline.cfm ");
thread name="t1" action="run" {
	sleep(1000);
	writeLog(file="baseline01", text="Bottom of t1");
}
writeLog(file="baseline01", text="Bottom of baseline.cfm");
</cfscript>