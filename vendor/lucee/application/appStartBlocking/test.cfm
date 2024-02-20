<cfscript>
	writeToLog("Top of test.cfm")

	executeSlowDbOperation()

	writeDump(URL)

	writeToLog("Bottom of test.cfm")
	writeToLog(repeatString("=", 50))
</cfscript>
