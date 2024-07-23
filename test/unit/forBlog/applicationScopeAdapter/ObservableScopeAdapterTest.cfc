import cfml.forBlog.applicationScopeAdapter.GeneralScopeAdapter
import cfml.forBlog.applicationScopeAdapter.ObservableScopeAdapter
import cfml.forBlog.observerService.SimpleObserverService

component extends=Testbox.system.BaseSpec {
    function run() {
        describe("Tests for ObservableScopeAdapter", () => {
            describe("Tests for set method", () => {
                it("functions as a ScopeAdapter when setting a key's value in the scope", () => {
                    var localScopeAdapter = new GeneralScopeAdapter(local)
                    var observerService = new SimpleObserverService()
                    var observableScopeAdapter = new ObservableScopeAdapter(localScopeAdapter, observerService)

                    observableScopeAdapter.set("testVariable", "test value")

                    expect(local).toHaveKey("testVariable")
                    expect(local.testVariable).toBe("test value")
                })

                it("triggers an event when set is called, which receives the key/value of the set call", () => {
                    var eventLog = []
                    var localScopeAdapter = new GeneralScopeAdapter(local)
                    var observerService = new SimpleObserverService()
                    var observableScopeAdapter = new ObservableScopeAdapter(localScopeAdapter, observerService)

                    observerService.on("scope.set", (event) => {
                        eventLog.append(event)
                    })

                    observableScopeAdapter.set("testVariable", "test value")

                    expect(eventLog).toHaveLength(1)
                    expect(eventLog[1]).toBe({
                        name = "scope.set",
                        data = javaCast("null", ""),
                        detail = {
                            key = "testVariable",
                            value = "test value"
                        }
                    })
                })
            })

            describe("Tests for get method", () => {
                it("functions as a ScopeAdapter when getting a value from the scope by its key", () => {
                    var localScopeAdapter = new GeneralScopeAdapter(local)
                    var observerService = new SimpleObserverService()
                    var observableScopeAdapter = new ObservableScopeAdapter(localScopeAdapter, observerService)

                    var testVariable = "test value"

                    var result = observableScopeAdapter.get("testVariable")

                    expect(result).toBe("test value")
                })
            })
        })
    }
}
