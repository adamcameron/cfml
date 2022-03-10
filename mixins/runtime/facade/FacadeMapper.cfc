component {

    public void function setFacadesFromMap(required Component target, required Component source, required struct map) {
        target.__getVariables = getVariables
        scopes = {
            public = target,
            private = target.__getVariables()
        }
        structDelete(target, "__getVariables")

        map.each((sourceMethod, mapping) => {
            targetMethod = mapping.keyExists("target") ? mapping.target : sourceMethod

            requestedAccess = mapping.keyExists("access") ? mapping.access : "private"
            targetAccess = requestedAccess == "public" ? "public" : "private"

            bind = mapping.keyExists("bind") && isBoolean(mapping.bind) ? mapping.bind : true

            proxy = bind
                ? () => source[sourceMethod](argumentCollection=arguments)
                : source[sourceMethod]

            scopes[targetAccess][targetMethod] = proxy
        })
    }

    private struct function getVariables(){
        return variables
    }
}
