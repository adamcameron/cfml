component extends=BaseTarget {

    variables.testValue = "VARIABLES SCOPE VALUE SET IN TARGET"
    this.testValue = "THIS SCOPE VALUE SET IN TARGET"

    function getActualVariablesScopeValue() {
        return variables.testValue
    }

    function getActualThisScopeValue() {
        return this.testValue
    }

    function getActualSuperScopeValue() {
        return super.getActualSuperValue()
    }
}
