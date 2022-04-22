component {

    //setsValueInCallingContext("set from pseudoConstructor")

    // variables:local here are references to the context of this object, not the calling context
    void function setsValueInCallingContext(required string message, context=isNull(local)?variables:local) {
        writeDump(context)
        context.message = message
    }

    string function returnsValueSetInFunctionAsCallingContext(required string message) {
        var findMe = "hi"
        setsValueInCallingContext(message)

        return local.message
    }
}
