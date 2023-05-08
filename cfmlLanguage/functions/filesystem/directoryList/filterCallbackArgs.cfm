<cfscript>
    dir = expandPath("./testFiles")
    result = directoryList(
        dir,
        true,
        "query",
        function(){
            writeDump(arguments)
            return true
        }
    )
    writeDump(result)
</cfscript>
