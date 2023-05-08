<cfscript>
thisDir = expandPath(".")

files = directoryList(path=thisDir, listInfo="query")

writeDump(files)
</cfscript>
