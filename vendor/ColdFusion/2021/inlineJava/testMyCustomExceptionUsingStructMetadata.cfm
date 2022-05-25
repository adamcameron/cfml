<cfscript>
    import vendor.ColdFusion.2021.inlineJava.MyCustomExceptionUsingStructMetadata;

    metadata = {
        firstName = "Zachary",
        lastName = "Cameron Lynch"
    }

    o = new MyCustomExceptionUsingStructMetadata()

    myCustomException = o.create("Oopsy", metadata)

    writeDump(myCustomException)

    throw(object=myCustomException)
</cfscript>
