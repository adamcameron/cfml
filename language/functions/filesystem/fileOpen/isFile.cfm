<cfscript>
	try {
		f = "";
		f = fileOpen(getCurrentTemplatePath());
		writeOutput("<br /><hr /><br /><br />");
		writeDump(f.getClass().getName());
	}
	finally{
		writeDump(f);
		writeOutput(isObject(f) && structkeyExists(f, "status") && f.status == "open");
		writeOutput(f.getClass().getName());
		//fileClose(f);
	}
</cfscript>