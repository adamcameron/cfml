component extends=theirs.TheirBase {

    function f() {
        var fromBase = super.f()

        return "from MySub: #fromBase#"
    }
}
