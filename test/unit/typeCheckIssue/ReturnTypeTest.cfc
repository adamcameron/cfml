import testbox.system.BaseSpec
import fixtures.UsesFullyQualifiedReturnType
import fixtures.UsesImport

component extends=BaseSpec {

    function run() {
        describe("Tests how import statements are respected by method return types", () => {
            describe("method return types are defined via fully-qualified name", () => {
                sut = new UsesFullyQualifiedReturnType()

                it("doesn't error when the returned object type matches", () => {
                    something = new com.corp.app1.Something()

                    expect(sut.returnsComSomething(something)).toBeInstanceOf("com.corp.app1.Something")
                })

                it("does error when the returned object type doesn't match", () => {
                    something = new org.group.app2.Something()
                    expect(() => sut.returnsComSomething(something)).toThrow(type="expression", regex=".*has an invalid return value.*")
                })
            })

            describe("method return types are defined via import", () => {
                sut = new UsesImport()
                it("doesn't error when the returned object type matches", () => {
                    something = new com.corp.app1.Something()

                    expect(sut.returnsComSomething(something)).toBeInstanceOf("com.corp.app1.Something")
                })

                it("should error when the returned object type doesn't match (but doesn't)", () => {
                    something = new org.group.app2.Something()

                    expect(() => sut.returnsComSomething(something)).toThrow() // The incoming function did not throw an expected exception
                })
            })

        })
    }
}
