import testbox.system.BaseSpec
//import com.somecompany.someapp.Unique

component extends=BaseSpec {

    function run() {
        describe("Testing method return types without imports", () => {
            if (CGI.script_name != "/test/unit/cfmlLanguage/types/luceeTypeCheck/runTests.cfm") {
                it(
                    title = "Skipped: can only be run from this dir, as it requires the Application.cfc to run to make some mappings",
                    body = () => {},
                    skip = true
                )
                return
            }

            it("works with unqualified return type when using fully-qualified return value", () => {
                uniqueInstance = returnsFullyQualifiedUnique()
                expect(uniqueInstance).toBeInstanceOf("com.somecompany.someapp.Unique")
            })

            it("works with unqualified return type when using unqualified return value", () => {
                expect(() => returnUnqualifiedUnique()).toThrow(type="Expression")
            })

            it("works with ambiguous unqualified return type when using fully-qualified return value (com variant)", () => {
                somethingInstance = returnsFullyQualifiedComSomething()
                expect(somethingInstance).toBeInstanceOf("com.somecompany.someapp.Something")
            })

            it("works with ambiguous unqualified return type when using fully-qualified return value (org variant)", () => {
                somethingInstance = returnsFullyQualifiedOrgSomething()
                expect(somethingInstance).toBeInstanceOf("org.someorg.anotherapp.Something")
            })

            it("works with wrong ambiguous unqualified return type when using fully-qualified return value (org variant)", () => {
                expect(() => returnsFullyQualifiedOrgSomethingWrongReturnType()).toThrow(type="expression")
            })
        })
    }

    private Unique function returnsFullyQualifiedUnique() {
        return new com.somecompany.someapp.Unique()
    }

    private Unique function returnUnqualifiedUnique() {
        return new Unique()
    }

    private Something function returnsFullyQualifiedComSomething() {
        return new com.somecompany.someapp.Something()
    }

    private Something function returnsFullyQualifiedOrgSomething() {
        return new org.someorg.anotherapp.Something()
    }

    private Unique function returnsFullyQualifiedOrgSomethingWrongReturnType() {
        return new org.someorg.anotherapp.Something()
    }
}
