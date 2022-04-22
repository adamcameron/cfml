import cfmlLanguage.syntax.static.Thing
import cfmlLanguage.syntax.static.FTP

component extends=testbox.system.BaseSpec {

    function run() {
        describe("Static syntax", () => {
            it("... works?", () => {
                expected = {expect="me"}
                result = Thing::adapter(expected)

                expect(result).toBe(expected)
            })
            it("... works if the class is called FTP?", () => {
                expected = {expect="me"}
                result = cfmlLanguage.syntax.static.FTP::adapter(expected)

                expect(result).toBe(expected)
            })

        })
    }
}
