<cfscript>
// nestedViaInclude.inc.cfm

writeLog(file="nestedViaInclude01", text="Top of nestedViaIncude.inc.cfm");
thread name="t2" action="run" {
	sleep(1000);
	writeLog(file="nestedViaInclude01", text="Bottom of t2");
}
writeLog(file="nestedViaInclude01", text="Bottom of nestedViaIncude.inc.cfm");
</cfscript>
