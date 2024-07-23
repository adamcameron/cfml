import net.vendor3.Vendor3Sub

component  {
    function f() {
        writeOutput("<p>myApp/UsesVendor3.cfc #getFunctionCalledName()#</p>")
        vendor3Sub = new Vendor3Sub()

        vendor3Sub.f()
    }
}
