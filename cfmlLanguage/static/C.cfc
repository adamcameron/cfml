component {

    static {
        static.multiplier = new Multiplier()
    }

    public static function doubleAll(x, y, z) {
        var m = static.multiplier
        return arrayMap(arguments, (v) => m.double(v))
    }

    public static function tripleAll(x, y, z) {
        return arrayMap(arguments, (v) => static.multiplier.triple(v))
    }
}
