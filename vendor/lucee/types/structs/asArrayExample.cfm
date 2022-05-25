<cfscript>
// control
st = {1="one", 2="two", 3 ="three"}

result = arrayMap(st, (v, i) => "#i#:#v#")
writeOutput(serializeJson(result)) // ["1:one","2:two","3:three"]

writeOutput("<br>")

// example
st = {0="zero", 1="one", 2="two", 3 ="three"}

try {
    result = arrayMap(st, (v, i) => "#i#:#v#")
    writeDump(result)
} catch (any e) {
    writeOutput(serializeJson([message=e.message, detail=e.detail, "lucee version" = server.lucee.version])) // ["can not set Element at position [0]","Index -1 out of bounds for length 3"]
}
</cfscript>
