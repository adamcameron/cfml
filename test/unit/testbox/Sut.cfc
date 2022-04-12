component {

    function a(message="") {
        return message & getFunctionCalledName()
    }
    function b(message="") {
        return message & getFunctionCalledName()
    }
    function c(message="") {
        return message & getFunctionCalledName()
    }
    function d(message="") {
        return message & getFunctionCalledName()
    }
    function e(message="") {
        return message & getFunctionCalledName()
    }

    function runThis(message="") {
        var aResult = a(message)
        var bResult = b(aResult)
        var cResult = c(bResult)
        var dResult = d(cResult)
        var eResult = e(dResult)

        return eResult
    }
}
