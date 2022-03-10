component {

    function init(firstProperty, secondProperty) {
        variables.firstProperty = firstProperty
        variables.secondProperty = secondProperty
    }

    function returnTheProperties() {
        return getPropertiesAsArray()
    }

    private function getPropertiesAsArray() {
        return [variables.firstProperty, variables.secondProperty]
    }
}
