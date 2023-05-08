<cfscript>
    include "./tinyTestFramework.cfm";

    // tests
    void function run() {
        describe("Stub tests for the main test rig to cfhttp to test the test result tallies", () => {
            it("is a top-level passing test", () => {
                expect(true).toBeTrue()
            })
            it("is a top-level failing test", () => {
                expect(true).toBeFalse()
            })
            it("is a top-level erroring test", () => {
                throw(type="UnexpectedException")
            })
            describe("Testing nesting 1", () => {
                it("is a nested passing test in its own describe", () => {
                    expect(true).toBeTrue()
                })
            })
            describe("Testing nesting 2", () => {
                it("is a nested failing test in its own describe", () => {
                    expect(true).toBeFalse()
                })
            })
            describe("Testing nesting 3", () => {
                it("is a nested erroring test in its own describe", () => {
                    throw(type="UnexpectedException")
                })
            })
            describe("deeper nesting", () => {
                describe("deeper nesting still", () => {
                    describe("waaay down here now", () => {
                        it("is a low-level passing test", () => {
                            expect(true).toBeTrue()
                        })
                        it("is a low-level failing test", () => {
                            expect(true).toBeFalse()
                        })
                        it("is a low-level erroring test", () => {
                            throw(type="UnexpectedException")
                        })
                    })
                })
            })
            describe("misx tests so that the total tally of each pass/fail/error is different", () => {
                it("is one more passing test", () => {
                    expect(true).toBeTrue()
                })
                describe("some failures", () => {
                    it("is first additional failing test", () => {
                        expect(true).toBeFalse()
                    })
                    it("is another additional failing test", () => {
                        expect(true).toBeFalse()
                    })
                })
                describe("even more errors", () => {
                    it("first additional erroring test", () => {
                        throw(type="UnexpectedException")
                    })
                    it("second additional erroring test", () => {
                        throw(type="UnexpectedException")
                    })
                    it("third additonal erroring test", () => {
                        throw(type="UnexpectedException")
                    })
                })
            })
        })
    }

    tinyTest.runTests()
</cfscript>
