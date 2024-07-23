<cfscript>
    function f() {
        var one = "tahi"
        var red = "whero"

        setInVariablesScope({one=one, red=red})
    }

    function setInVariablesScope(locals) {
        vars = variables
        locals.each((key, value) => {
            vars[key] = value
        })
    }

    f()

    writeOutput(variables.keyExists("one") ? variables.one : "one not set in variables")
    writeOutput("<br>")
    writeOutput(variables.keyExists("red") ? variables.red : "red not set in variables")
</cfscript>
