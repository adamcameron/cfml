component {

    static {
        someVar = "someVar_default"
    }

    public  static  void function setSomeVar(value) {
        static.someVar = value
    }

    public static string function getSomeVar() {
        return static.someVar
    }
}
