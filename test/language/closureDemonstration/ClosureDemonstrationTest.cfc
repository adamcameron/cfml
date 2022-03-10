import testbox.system.BaseSpec
import cfmlInDocker.miscellaneous.closureDemonstration.SourceUsingStatements
import cfmlInDocker.miscellaneous.closureDemonstration.SourceUsingExpressions
import cfmlInDocker.miscellaneous.closureDemonstration.Target

component extends=BaseSpec {

    function run() {
        describe("Demonstrating how closure works", () => {
            describe("doesn't maintain context when defining functions via statement", () => {

                beforeEach(() => {
                    variables.source = new SourceUsingStatements()
                    variables.target = new Target()
                })

                it("references the target's variables scope, not the source's", () => {
                    variables.target.getVariablesScopeValue = variables.source.getVariablesScopeValue

                    valueInTarget = variables.target.getActualVariablesScopeValue()
                    valueInSource = variables.source.getActualVariablesScopeValue()

                    actual = variables.target.getVariablesScopeValue()

                    expect(actual).toBe(valueInTarget)
                    expect(actual).notToBe(valueInSource)
                })

                it("references the target's this scope, not the source's", () => {
                    variables.target.getThisScopeValue = variables.source.getThisScopeValue

                    valueInTarget = variables.target.getActualThisScopeValue()
                    valueInSource = variables.source.getActualThisScopeValue()

                    actual = variables.target.getThisScopeValue()

                    expect(actual).toBe(valueInTarget)
                    expect(actual).notToBe(valueInSource)
                })

                it("references the target's super scope, not the source's", () => {
                    variables.target.getSuperScopeValue = variables.source.getSuperScopeValue

                    valueInTarget = variables.target.getActualSuperScopeValue()
                    valueInSource = variables.source.getActualSuperScopeValue()

                    actual = variables.target.getSuperScopeValue()

                    expect(actual).toBe(valueInTarget)
                    expect(actual).notToBe(valueInSource)
                })
            })
            describe("does maintain context when defining functions via expression", () => {

                beforeEach(() => {
                    variables.source = new SourceUsingExpressions()
                    variables.target = new Target()
                })

                it("references the target's variables scope, not the source's", () => {
                    variables.target.getVariablesScopeValue = variables.source.getVariablesScopeValue

                    valueInTarget = variables.target.getActualVariablesScopeValue()
                    valueInSource = variables.source.getActualVariablesScopeValue()

                    actual = variables.target.getVariablesScopeValue()

                    expect(actual).toBe(valueInSource)
                    expect(actual).notToBe(valueInTarget)
                })

                it("references the target's this scope, not the source's", () => {
                    variables.target.getThisScopeValue = variables.source.getThisScopeValue

                    valueInTarget = variables.target.getActualThisScopeValue()
                    valueInSource = variables.source.getActualThisScopeValue()

                    actual = variables.target.getThisScopeValue()

                    expect(actual).toBe(valueInSource)
                    expect(actual).notToBe(valueInTarget)
                })

                it("references the target's super scope, not the source's", () => {
                    variables.target.getSuperScopeValue = variables.source.getSuperScopeValue

                    valueInTarget = variables.target.getActualSuperScopeValue()
                    valueInSource = variables.source.getActualSuperScopeValue()

                    actual = variables.target.getSuperScopeValue()

                    expect(actual).toBe(valueInSource)
                    expect(actual).notToBe(valueInTarget)
                })
            })
        })
    }
}
