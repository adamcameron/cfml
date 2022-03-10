component {
    variables.testBaseValue = "VARIABLES SCOPE VALUE SET IN BASETARGET"

    function getActualSuperValue() {
        return variables.testBaseValue
    }
}
