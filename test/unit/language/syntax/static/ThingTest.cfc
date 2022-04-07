import testbox.system.BaseSpec
import language.syntax.static.Thing
import language.syntax.static.FTP

component extends=BaseSpec {

    function run() {
        describe("Static syntax", () => {
            it("... works?", () => {
                expected = {expect="me"}
                result = Thing::adapter(expected)

                expect(result).toBe(expected)
            })
            it("... works if the class is called FTP?", () => {
                expected = {expect="me"}
                result = language.syntax.static.FTP::adapter(expected)

                expect(result).toBe(expected)
            })

        })
    }
}
