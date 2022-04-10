<cfscript>
// nested.cfm

writeLog(file="nested01", text="Top of nested.cfm ");
thread name="t1" action="run" {
	sleep(1000);
	thread name="t2" action="run" {
		sleep(1000);
		writeLog(file="nested01", text="Bottom of t2");
	}
	writeLog(file="nested01", text="Bottom of t1");
}
writeLog(file="nested01", text="Bottom of nested.cfm");
</cfscript>