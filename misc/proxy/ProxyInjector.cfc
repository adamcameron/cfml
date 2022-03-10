component {

    function proxyMethod(target, source, method) {
        proxy = () => {
            return source[method](argumentCollection=arguments)
        }
        target.__setInVariables = setInVariables
        target.__setInVariables(proxy, method)
    }

    private function setInVariables(value, key) {
        variables[key] = value
    }
}
