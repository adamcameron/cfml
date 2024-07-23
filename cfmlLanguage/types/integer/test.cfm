<cfscript>
o = new C()

testCases = [
    {label="42", value=42},
    {label="4.2", value=4.2},
    {label="new integer()", value=new integer()}
]

testCases.each((testCase) => {
    writeOutput("<h2>Testing with #testCase.label#</h2>")
    try {
        result = o.takesInteger(testCase.value)
        writeOutput("o.takesInteger(#testCase.label#) returned #serializeJson(result)#<br>")
    }catch (any e) {
        writeDump([
            message = e.message,
            detail = e.detail
        ])
    }

    try {
        result = o.returnsInteger(testCase.value)
        writeOutput("o.returnsInteger(#testCase.label#) returned #serializeJson(result)#<br>")
    }catch (any e) {
        writeDump([
            message = e.message,
            detail = e.detail
        ])
    }
    writeOutput("<hr>")
})
</cfscript>
