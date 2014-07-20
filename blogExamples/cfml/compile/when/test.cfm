<cfscript>
	// test.cfm
	writeLog(file=application.logname, text="top of test.cfm");
	sleep(URL.delay);
	include "inc.cfm";

	sleep(URL.delay);
	cfmodule(template="tag.cfm");

	sleep(URL.delay);
	o = new C();

	sleep(URL.delay);
	o.f();
</cfscript>