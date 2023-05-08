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

    this.getVariablesScopeValue = function () {
        return variables.testValue
    }

    this.getThisScopeValue = function () {
        return this.testValue
    }

    this.getSuperScopeValue = function () {
        return super.getActualSuperValue()
    }
}
