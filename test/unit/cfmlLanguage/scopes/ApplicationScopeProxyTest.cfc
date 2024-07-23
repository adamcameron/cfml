import testbox.system.BaseSpec
import cfml.cfmlLanguage.scopes.ApplicationScopeProxy

component extends=BaseSpec {

    function run() {
        describe("Tests of ApplicationScopeProxy", () => {
            describe("Tests for the set method", () => {
                it("sets a variable", () => {
                    testApp = {}
                    proxy = new ApplicationScopeProxy(testApp)
                    proxy.set("testKey", "TEST_VALUE")

                    expect(testApp).toHaveKey("testKey")
                    expect(testApp.testKey).toBe("TEST_VALUE")
                })

                it("sets a variable with a deep path", () => {
                    testApp = {}
                    proxy = new ApplicationScopeProxy(testApp)
                    proxy.set("one.two.three", "TEST_VALUE")

                    expect(testApp).toHaveKey("one")
                    expect(testApp.one.two.three).toBe("TEST_VALUE")
                })
            })

            describe("Tests for the get method", () => {
                it("gets a variable", () => {
                    testApp = {testKey = "TEST_VALUE"}
                    proxy = new ApplicationScopeProxy(testApp)
                    result = proxy.get("testKey")

                    expect(result).toBe("TEST_VALUE")
                })

                it("gets a variable with a deep path", () => {
                    testApp = {one={two={three = "TEST_VALUE"}}}
                    proxy = new ApplicationScopeProxy(testApp)
                    result = proxy.get("one.two.three", "TEST_VALUE")

                    expect(result).toBe("TEST_VALUE")
                })

                it("throws an exeption if the key is not found", () => {
                    testApp = {}
                    proxy = new ApplicationScopeProxy(testApp)

                    expect(() => {
                        proxy.get("one.two.three", "TEST_VALUE")
                    }).toThrow(
                        type = "ApplicationScopeProxy.KeyNotFoundException",
                        regex = "Key \[one\.two\.three\] not found in application scope"
                    )
                })
            })

            describe("Tests for the withReadOnlyLock method", () => {
                it("waits until it can get a lock before continuing", () => {
                    proxy = new ApplicationScopeProxy({})

                    telemetry = ["test start"]
                    t1 = runAsync(() => {
                        telemetry.append("t1 started")
                        lock scope="application" type="exclusive" timeout=5 throwontimeout=true {
                            sleep(1000)
                        }
                        telemetry.append("t1 ended")
                    })
                    t2 = runAsync(() => {
                        telemetry.append("t2 started")

                        proxy.withReadOnlyLock(() => {
                            telemetry.append("withReadOnlyLock ran")
                        })

                        telemetry.append("t2 ended")
                    })
                    t1.get()
                    t2.get()

                    lockTelemetry = telemetry.find("withReadOnlyLock ran")
                    t1EndTelemetry = telemetry.find("t1 ended")
                    expect(lockTelemetry).toBeGt(t1EndTelemetry, serializeJson(telemetry))
                })
            })

            describe("Tests for the withExclusiveLock method", () => {
                it("waits until it can get a lock before continuing", () => {
                    proxy = new ApplicationScopeProxy({})

                    telemetry = ["test start"]
                    t1 = runAsync(() => {
                        telemetry.append("t1 started")
                        lock scope="application" type="readlonly" timeout=5 throwontimeout=true {
                            sleep(1000)
                        }
                        telemetry.append("t1 ended")
                    })
                    t2 = runAsync(() => {
                        telemetry.append("t2 started")

                        proxy.withExclusiveLock(() => {
                            telemetry.append("withExclusiveLock ran")
                        })

                        telemetry.append("t2 ended")
                    })
                    t1.get()
                    t2.get()

                    lockTelemetry = telemetry.find("withExclusiveLock ran")
                    t1EndTelemetry = telemetry.find("t1 ended")
                    expect(lockTelemetry).toBeGt(t1EndTelemetry, serializeJson(telemetry))
                })
            })
        })
    }
}
