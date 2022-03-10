<cfscript>
writeDump(server.lucee.version)

input = {k="v"}

result = input.reduce((r={}, k, v) => {
    writeDump(arguments)
    return {}
})

f = function(st={}) {
    writeDump(arguments)
}

f()
</cfscript>
