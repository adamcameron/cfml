<cfscript>
serverDetails = {
    server="ftp.dlptest.com",
    username="dlpuser",
    password="rNrKYTX9g7z3RgJRmxWuGHbeu"
}

serverDetailsx = {
    server="ftp.backend",
    username="cfml",
    password="12345"
}

function usingClassicMode() localmode="classic" {
    cfftp(connection="c1", action="open", attributeCollection=serverDetails)
    cfftp(connection="c2", action="open", attributeCollection=serverDetails, result="c2ConnectionResult")
    writeDump(label=getFunctionCalledName(), var=[
        "cfftp is in variables" = structKeyExists(variables, "cfftp"),
        "c2ConnectionResult is in variables" = structKeyExists(variables, "c2ConnectionResult"),
        "cfftp is in local?" = structKeyExists(local, "cfftp"),
        "c2ConnectionResult is in local?" = structKeyExists(local, "c2ConnectionResult")
    ])
}
function usingModernMode() localmode="modern" {
    cfftp(connection="c3", action="open", attributeCollection=serverDetails)
    cfftp(connection="c4", action="open", attributeCollection=serverDetails, result="c4ConnectionResult")
    writeDump(label=getFunctionCalledName(), var=[
        "cfftp is in variables" = structKeyExists(variables, "cfftp"),
        "c2ConnectionResult is in variables" = structKeyExists(variables, "c4ConnectionResult"),
        "cfftp is in local?" = structKeyExists(local, "cfftp"),
        "c2ConnectionResult is in local?" = structKeyExists(local, "c4ConnectionResult")
    ])
}

usingClassicMode()
usingModernMode()
</cfscript>
