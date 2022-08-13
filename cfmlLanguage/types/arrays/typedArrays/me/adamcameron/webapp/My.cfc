import cfml.cfmlLanguage.types.arrays.typedArrays.com.vendor.lib.Thing

component {
    public Thing[] function getThings() {
        return ["Thing"][];
    }

    public Thing[] function getThingsViaFqnOnReturn() {
        return ["cfml.cfmlLanguage.types.arrays.typedArrays.com.vendor.lib.Thing"][];
    }

    public cfml.cfmlLanguage.types.arrays.typedArrays.com.vendor.lib.Thing[] function getThingsViaFqnOnType() {
        return ["Thing"][];
    }

    public cfml.cfmlLanguage.types.arrays.typedArrays.com.vendor.lib.Thing[] function getThingsViaFqnOnBoth() {
        return ["cfml.cfmlLanguage.types.arrays.typedArrays.com.vendor.lib.Thing"][];
    }
}
