<cfscript>
	data = {
		text = fileRead(expandPath("./utf8_issue.txt"))
	};
	json = serializeJson(data);
	writeDump(variables);
</cfscript>