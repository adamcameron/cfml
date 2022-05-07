import theirs.TheirBase

component extends=TheirBase {

    function f() {
        var fromBase = super.f()

        return "from MySub: #fromBase#"
    }
}
