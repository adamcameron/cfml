component {

    static {
        static.setInInitialiser = noisyNow("static initialiser")
    }

    static.setInPseudoConstructor = noisyNow("pseudoconstructor (class)")
    this.setInPseudoConstructor = My::noisyNow("pseudoconstructor (object)")

    public static function getVars() {
        return [
            setInInitialiser = static.setInInitialiser,
            setInPseudoConstructor = static.setInPseudoConstructor
        ]
    }

    private static function noisyNow(what) {
        writeOutput("I WAS CALLED FOR #what#<br>")
        return now()
    }
}
