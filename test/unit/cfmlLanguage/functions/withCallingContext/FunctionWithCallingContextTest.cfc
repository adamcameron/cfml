import cfml.cfmlLanguage.functions.withCallingContext.C

component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests for setsValueInCallingContext", () => {
            xit("sets a value in the variables scope when called outside the context of something with a local scope", () => {
                o = new C()
                o.getVariables = getVariables

                variablesFromO = o.getVariables()

                expect(variablesFromO).toHaveKey("message")
                expect(variablesFromO.message).toBe("set from pseudoConstructor")
            })

            xit("sets a value in the local scope when called from something with a local scope", () => {
                testMessage = "set from within method call"
                o = new C()

                result = o.returnsValueSetInFunctionAsCallingContext(testMessage)

                expect(result).toBe(testMessage)
            })

        })
    }

    function getVariables() {
        return variables
    }
}
