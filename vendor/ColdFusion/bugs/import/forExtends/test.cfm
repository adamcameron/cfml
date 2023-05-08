<cfscript>
import mine.MySubUsingImport
import mine.MySubUsingQualified
import theirs.TheirBase

try {
    writeOutput("Using import for creating TheirBase<br>")
    theirBase = new TheirBase()
    writeOutput(theirBase.f())
} catch (any e) {
    writeDump([
        message = e.message,
        detail = e.detail
    ])
}
writeOutput("<hr>")

try {
    writeOutput("Using import for extexding TheirBase<br>")
    mySubUsingImport = new MySubUsingImport()
    writeOutput(mySubUsingImport.f())
} catch (any e) {
    writeDump([
        message = e.message,
        detail = e.detail
    ])
}
writeOutput("<hr>")

try {
    writeOutput("Using fully-qualified path for extexding TheirBase<br>")
    mySubUsingImport = new MySubUsingQualified()
    writeOutput(mySubUsingImport.f())
} catch (any e) {
    writeDump([
        message = e.message,
        detail = e.detail
    ])
}
writeOutput("<hr>")
</cfscript>
