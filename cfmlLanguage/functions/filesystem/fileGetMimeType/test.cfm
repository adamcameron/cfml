<cfscript>
thisDir = getDirectoryFromPath(getCurrentTemplatePath())

try {
    mimeType = fileGetMimeType(thisDir & "valid.gif", true)
    writeDump([mimeType])
} catch (any e) {
    writeDump([e.message, e.detail])
}

try {
    mimeType = fileGetMimeType(thisDir & "actuallyJson.gif", true)
    writeDump([mimeType])
} catch (any e) {
    writeDump([e.message, e.detail])
}

try {
    mimeType = fileGetMimeType(thisDir & "actuallyXml.gif", true)
    writeDump([mimeType])
} catch (any e) {
    writeDump([e.message, e.detail])
}

try {
    mimeType = fileGetMimeType(thisDir & "empty.gif", true)
    writeDump([mimeType])
} catch (any e) {
    writeDump([e.message, e.detail])
}

try {
    mimeType = fileGetMimeType(thisDir & "nonExistent.gif", true)
    writeDump([mimeType])
} catch (any e) {
    writeDump([e.type, e.message, e.detail])
}
</cfscript>
