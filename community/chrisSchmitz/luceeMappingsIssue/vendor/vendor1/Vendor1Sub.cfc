component extends=org.vendor2.Vendor2Base {
    function f() {
        super.f()
        writeOutput("<p>vendor/vendor1/Vendor1Sub.cfc #getFunctionCalledName()#</p>")
    }
}
