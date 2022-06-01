import edu.vendor4.Vendor4Base

component extends=Vendor4Base {
    function f() {
        super.f()
        writeOutput("<p>vendor/vendor3/Sub.cfc #getFunctionCalledName()#</p>")
    }
}
