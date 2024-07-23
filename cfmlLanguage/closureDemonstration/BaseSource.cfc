component {
    variables.testBaseValue = "VARIABLES SCOPE VALUE SET IN BASESOURCE"

    function getActualSuperValue() {
        return variables.testBaseValue
    }
}
