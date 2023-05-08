<cfscript>
// nestedViaInclude.cfm

writeLog(file="nestedViaInclude01", text="Top of nestedViaInclude.cfm ");
thread name="t1" action="run" {
	sleep(1000);
	include "nestedViaInclude.inc.cfm";
	writeLog(file="nestedViaInclude01", text="Bottom of t1");
}
writeLog(file="nestedViaInclude01", text="Bottom of nestedViaInclude.cfm");
</cfscript>