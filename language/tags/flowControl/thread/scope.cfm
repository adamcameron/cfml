<cfscript>
	variables.external	= "external set outside thread";
	variables.status	= "status set outside thread";
	thread name="t1" action="run" {
		savecontent variable="dump"{
			writeDump(thread);
		}
		fileWrite("C:\temp\dump.html", dump);
		writeLog(file="threadtest", text=status);
		writeLog(file="threadtest", text=external);
	}
	thread action="join" name="t1";
</cfscript>
