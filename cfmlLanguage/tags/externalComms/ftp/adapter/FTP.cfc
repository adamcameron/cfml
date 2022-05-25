component {

    public static struct function adapter() { // any args are passed as attributes to the tag call
        cfftp(attributeCollection=arguments)
        if (arguments.keyExists("result") && local.keyExists(arguments.result)) {
            return local[arguments.result];
        }
        return cfftp
    }
}
