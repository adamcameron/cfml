import cfml.forBlog.observerService.SimpleObserverService

component extends=Testbox.system.BaseSpec {
    function run() {
        describe("Tests for ObserverService", () => {
            describe("Tests for on method", () => {
                it("registers an event handler", () => {
                    var observerService = new SimpleObserverService()

                    var eventResults = []

                    observerService.on("testEvent", () => {
                        eventResults.append("test event")
                    })

                    observerService.trigger("testEvent")

                    expect(eventResults).toBe(["test event"])
                })

                it("registers multiple event handlers", () => {
                    var observerService = new SimpleObserverService()

                    var eventResults = []

                    observerService.on("testEvent", () => {
                        eventResults.append("test event handler 1")
                    })
                    observerService.on("testEvent", () => {
                        eventResults.append("test event handler 2")
                    })

                    observerService.trigger("testEvent")

                    expect(eventResults).toBe(["test event handler 1", "test event handler 2"])
                })

                it("registers multiple handlers for multiple events", () => {
                    var observerService = new SimpleObserverService()

                    var event1Results = []
                    var event2Results = []

                    observerService.on("testEvent1", () => {
                        event1Results.append("test event1")
                    })
                    observerService.on("testEvent2", () => {
                        event2Results.append("test event2")
                    })

                    observerService.trigger("testEvent1")

                    expect(event1Results).toBe(["test event1"])

                    observerService.trigger("testEvent2")

                    expect(event2Results).toBe(["test event2"])
                })
            })

            describe("tests for trigger method", () => {
                it("triggers a registered event", () => {
                    var observerService = new SimpleObserverService()

                    var eventResults = []

                    observerService.on("testEvent", () => {
                        eventResults.append("test event")
                    })

                    observerService.trigger("testEvent")

                    expect(eventResults).toBe(["test event"])
                })

                it("does nothing when triggering an unregistered event", () => {
                    var observerService = new SimpleObserverService()

                    expect(() => observerService.trigger("testEvent")).notToThrow()
                })

                it("triggers event handlers until one returns false", () => {
                    var observerService = new SimpleObserverService()

                    var eventResults = []

                    observerService.on("testEvent", () => {
                        eventResults.append("test event handler 1")
                    })
                    observerService.on("testEvent", () => {
                        eventResults.append("test event handler 2")
                    })
                    observerService.on("testEvent", () => {
                        eventResults.append("test event handler 3")
                        return false
                    })
                    observerService.on("testEvent", () => {
                        eventResults.append("should not see this in results")
                    })

                    observerService.trigger("testEvent")

                    expect(eventResults).toBe([
                        "test event handler 1",
                        "test event handler 2",
                        "test event handler 3"
                    ])
                })

                it("passes event name and data specified in the `on` call to the event handler when run", () => {
                    var observerService = new SimpleObserverService()

                    var eventResults = []

                    observerService.on("testEvent", (event) => {
                        eventResults.append([
                            message = "test event handler 1",
                            event = event
                        ])
                    }, {key="value"})

                    observerService.trigger("testEvent")

                    expect(eventResults).toBe([[
                        message = "test event handler 1",
                        event = {
                            name = "testEvent",
                            data = {key="value"},
                            detail = {}
                        }
                    ]])
                })

                it("handles no data specified in the `on` call to the event handler when run", () => {
                    var observerService = new SimpleObserverService()

                    var eventResults = []

                    observerService.on("testEvent", (event) => {
                        eventResults.append([
                            message = "test event handler 1",
                            event = event
                        ])
                    })

                    observerService.trigger("testEvent")

                    expect(eventResults[1].message).toBe("test event handler 1")
                    expect(eventResults[1].event.name).toBe("testEvent")
                    expect(eventResults[1].event?.data).toBeNull()
                })

                it("passes any extra details as part of the event", () => {
                    var observerService = new SimpleObserverService()

                    var eventResults = []

                    observerService.on("testEvent", (event) => {
                        eventResults.append([
                            message = "test event handler 1",
                            event = event
                        ])
                    }, {key="value set in handler"})

                    observerService.trigger("testEvent", {
                        key = "value set by trigger"
                    })
                    expect(eventResults).toBe([[
                        message = "test event handler 1",
                        event = {
                            name = "testEvent",
                            data = {key = "value set in handler"},
                            detail = {key = "value set by trigger"}
                        }
                    ]])
                })
            })
        })
    }
}
