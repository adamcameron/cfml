component {

    static.setInPseudoConstructor = MyOther::noisyNow("pseudoconstructor (static)")
    this.setInPseudoConstructor = MyOther::noisyNow("pseudoconstructor (this)")
    variables.setInPseudoConstructor = MyOther::noisyNow("pseudoconstructor (variables)")

    private static function noisyNow(what) {
        writeOutput("I WAS CALLED FOR #what#<br>")
        return now()
    }

    public static function getVars() {
        return [
            static_setInPseudoConstructor = static?.setInPseudoConstructor
        ]
    }

    public function getVars() {
        return MyOther::getVars().append([
            this_setInPseudoConstructor = this?.setInPseudoConstructor,
            variables_setInPseudoConstructor = variables?.setInPseudoConstructor
        ])
    }
}
