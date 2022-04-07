import testbox.system.BaseSpec
import language.tagsVsScriptDemonstrations.combinations.ScriptVersion
import language.tagsVsScriptDemonstrations.combinations.TagsVersion

component extends=BaseSpec {

    function beforeAll() {
        variables.testArray = ["A", "B", "C", "D", "E"]
        variables.expectedCombinations = [
            "AB", "AC", "AD", "AE",
            "BC", "BD", "BE",
            "CD", "CE",
            "DE"
        ]
    }

    function run() {
        describe("Testing script version", () => {
            it("returns the expected combinations", () => {
                sut = new ScriptVersion()
                result = sut.getCombinations(variables.testArray)

                expect(result).toBe(variables.expectedCombinations)
            })
        })
        describe("Testing tags version", () => {
            it("returns the expected combinations", () => {
                sut = new TagsVersion()
                result = sut.getCombinations(variables.testArray)

                expect(result).toBe(variables.expectedCombinations)
            })
        })
    }
}