<cfscript>
    z = new Person()
    z.setFirstName("Zachary")
    z.setLastName("Cameron Lynch")

    writeDump(z.check())

    writeDump([
        via = "property",
        firstName = z.firstName,
        laststName = z.lastName
    ])
    writeDump([
        via = "method",
        firstName = z.getFirstName(),
        laststName = z.getLastName()
    ])
</cfscript>
