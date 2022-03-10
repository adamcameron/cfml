<cfscript>
array = []

list = array.reduce((result="", value) => {
    return result.listAppend(value.ucase())
})
writeDump(list)
</cfscript>
