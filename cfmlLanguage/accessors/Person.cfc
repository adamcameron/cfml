component accessors=true invokeImplicitAccessor=true {

    property firstName;
    property lastName;

    function getFirstName() {
        writeOutput("[#getFunctionCalledName()# called]<br>")
        return variables.firstName
    }

    function setFirstName(firstName) {
        writeOutput("[#getFunctionCalledName()# called]<br>")
        variables.firstName = firstName
    }

    function check() {
        return [
            this = this,
            variables = variables
        ]
    }
}
