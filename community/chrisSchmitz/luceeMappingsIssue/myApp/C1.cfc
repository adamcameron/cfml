component {

    function f() {
        writeOutput("<p>#getCurrentTemplatePath()# #getFunctionCalledName()#</p>")
        try {
           c2 = new myApp.C2()
           c2.f()
        } catch (any e) {
            writeDump([
                message = e.message,
                detail = e.detail
            ])
        }
    }
}
