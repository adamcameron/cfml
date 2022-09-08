<cfscript>
person = new Person()
person.firstName = "Annie"
person.middleName = "Jean"
person.lastName = "Easley"

writeOutput(person.fullName)

try {
    writeOutput(person.firstName)
} catch(any e) {
    writeOutput(e.message)
}
</cfscript>
