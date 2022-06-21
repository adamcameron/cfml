<cfscript>
paths = [
    "/existent-directory-with-index-cfm/",
    "/existent-directory-without-index-cfm/",
    "/non-existent-directory/"
]
paths.each((path) => writeOutput("expandPath('#path#'): #expandPath(path)# (index.cfm? #fileExists(expandPath('#path#index.cfm'))#)<br>"))


writeOutput("<br>#server.coldfusion.productVersion# / #server.os.name# / #server.os.additionalInformation# / #server.os.version# / #server.os.arch#<br>")
</cfscript>
