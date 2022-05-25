component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests of afterEach and aroundEach lifecycle event handlers on failing tests", () => {
            aroundEach((spec) => {
                writeOutput("<hr>aroundEach before<br>")
                spec.body()
                writeOutput("aroundEach after<br>")
            })

            it ("is a failing test", () => {
                writeOutput("failing test ran<br>")
                expect(true).toBeFalse()
            })

            it ("is an erroring test (on purpose)", () => {
                writeOutput("failing test ran<br>")
                throw "error";
            })
        })
    }
}
