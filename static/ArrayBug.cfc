component {

    static {
        static.myStaticVar = "value"
    }

    public static function getMyStaticVarInAnArray() {
        return [ArrayBug::myStaticVar]

        /* this works fine
        var array = []
        array.append(ArrayBug::myStaticVar)
        return array
        */
    }

}
