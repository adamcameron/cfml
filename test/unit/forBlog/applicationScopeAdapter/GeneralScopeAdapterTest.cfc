import cfml.forBlog.applicationScopeAdapter.GeneralScopeAdapter

component extends=Testbox.system.BaseSpec {
    function run() {
        describe("Tests for GeneralScopeAdapter", () => {
            describe("Tests for set method", () => {
                it("sets a key's value in the scope", () => {
                    var localScopeAdapter = new GeneralScopeAdapter(local)

                    localScopeAdapter.set("testVariable", "test value")

                    expect(local).toHaveKey("testVariable")
                    expect(local.testVariable).toBe("test value")
                })
            })

            describe("Tests for get method", () => {
                it("gets a value from the scope by its key", () => {
                    var localScopeAdapter = new GeneralScopeAdapter(local)
                    var testVariable = "test value"

                    var result = localScopeAdapter.get("testVariable")

                    expect(result).toBe("test value")
                })
            })
        })
    }
}
