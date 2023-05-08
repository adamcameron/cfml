<cfscript>
    StaticPerson.firstName = "Connor"
    StaticPerson.lastName = "MacLeod"

    writeOutput(StaticPerson::getFullName())

    try {
        writeOutput(StaticPerson.firstName)
    } catch(any e) {
        writeOutput(e.message)
    }
</cfscript>
