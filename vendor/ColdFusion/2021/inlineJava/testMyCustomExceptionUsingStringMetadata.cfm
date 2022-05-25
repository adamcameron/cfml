<cfscript>
    import vendor.ColdFusion.2021.inlineJava.MyCustomExceptionUsingStringMetadata;

    metadata = "Zachary Cameron Lynch"

    o = new MyCustomExceptionUsingStringMetadata()

    myCustomException = o.create("Oopsy", metadata)

    writeDump(myCustomException)

    throw(object=myCustomException)
</cfscript>
