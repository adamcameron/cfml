<cfscript>
	writeToLog("Top of application pseudo-constructor")

    setsettings()
    loadDatasources()
    loadMappings()

	writeToLog("Bottom of application pseudo-constructor")
</cfscript>
