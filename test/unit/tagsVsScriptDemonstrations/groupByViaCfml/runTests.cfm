<cfscript>
private query function getGroupedRecords() {
    wddx = fileRead("#getThisDirectory()#/groupedRecords.wddx")
    wddx action="wddx2cfml" input=wddx output="query";
    return query
}

private string function getThisDirectory() {
    return getDirectoryFromPath(getCurrentTemplatePath())
}

q = getGroupedRecords()

writeDump([
    q,
    q.stgl[1],
    q.stgl[1].toString()
])
</cfscript>
