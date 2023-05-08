<cfscript>
writeDump([
    "myVariable" = StaticFinal::myVariable,
    "MY_CONST" = StaticFinal::MY_CONST
])

StaticFinal::myVariable = 19
writeDump([
    "myVariable" = StaticFinal::myVariable,
])

try {
    StaticFinal::MY_CONST = 41
} catch (any e) {
    writeDump(e)

}

writeDump(StaticFinal::getMyConst())
</cfscript>
