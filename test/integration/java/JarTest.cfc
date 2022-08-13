component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests jar file", () => {

            it("doesn't error", () => {
                test = createObject("java", "me.adamcameron.test.TestLogger")
                expect(test.test()).toBe("Worked OK")
            })
        })
    }
}
