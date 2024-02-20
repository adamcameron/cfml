component {
    function init() {
        writeOutput("Main init<br>")
        variables.sub = new Parent$Sub()
    }

    function getSub() {
        return variables.sub
    }
}

component name="Sub" {
    function init() {
        writeOutput("Sub init<br>")
    }
}
