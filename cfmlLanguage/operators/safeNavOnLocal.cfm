<cfscript>
function f() {
    var thisLocalOneIsSet = true
    variables.thisVariablesOneIsSet = true

    writeOutput("thisVariablesOneIsSet: [#variables?.thisVariablesOneIsSet#]<br>")
    writeOutput("thisVariablesOneIsNotSet: [#variables?.thisVariablesOneIsNotSet#]<br>")

    writeOutput("thisLocalOneIsSet: [#local?.thisLocalOneIsSet#]<br>")
    writeOutput("thisLocalOneIsNotSet: [#local?.thisLocalOneIsNotSet#]<br>")
}

f()
</cfscript>
