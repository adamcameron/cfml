component  {
    function f() {
        writeOutput("<p>myApp/UsesVendor1.cfc #getFunctionCalledName()#</p>")
        vendor1Sub = new com.vendor1.Vendor1Sub()

        vendor1Sub.f()
    }
}
