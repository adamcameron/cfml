<cfscript>
other.one = "tahi"
other.red = "whero"

setInVariablesScope({one=other.one, red=other.red})

function setInVariablesScope(locals) {
    locals.each((key, value) => {
        variables[key] = value
    })
}


writeOutput(variables.keyExists("one") ? variables.one : "one not set in variables")
writeOutput("<br>")
writeOutput(variables.keyExists("red") ? variables.red : "red not set in variables")
</cfscript>
