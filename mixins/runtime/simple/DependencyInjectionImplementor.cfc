component  {

    function wireStuffIn(someObject, someMixin) {
        someObject.__putVariable = putIntoVariables
        structKeyArray(someMixin).each((methodName) => {
            someObject.__putVariable(someMixin[methodName], methodName)
        })
        structDelete(someObject, "__putVariable")
    }

    function putIntoVariables(value, key){
        variables[key] = value
    }
}
