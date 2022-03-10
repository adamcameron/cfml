<cfscript>
function getNameFunctionWasCalledWith() {
    return getFunctionCalledName()
}

expected = "getNameFunctionWasCalledWith"
actual = getNameFunctionWasCalledWith()


writeDump([
    "expected": expected,
    "actual": actual,
    "pass?": compare(expected, actual) == 0
]);

</cfscript>
