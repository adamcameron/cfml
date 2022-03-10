component extends=BaseSource {

    variables.testValue = "VARIABLES SCOPE VALUE SET IN SOURCE"
    this.testValue = "THIS SCOPE VALUE SET IN SOURCE"

    function getActualVariablesScopeValue() {
        return variables.testValue
    }

    function getActualThisScopeValue() {
        return this.testValue
    }

    function getActualSuperScopeValue() {
        return super.getActualSuperValue()
    }

    function getVariablesScopeValue() {
        return variables.testValue
    }

    function getThisScopeValue() {
        return this.testValue
    }

    function getSuperScopeValue() {
        return super.getActualSuperValue()
    }
}
