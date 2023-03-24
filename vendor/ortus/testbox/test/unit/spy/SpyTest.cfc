import testbox.system.BaseSpec

component extends=BaseSpec {

    function beforeAll() {
        variables.mockbox = getMockBox()
    }

    function run() {
        describe("Tests $spy function in TestBox", () => {
            it("shows the spyOnMeAsIReverseThisString working as a baseline", () => {
                sut = new SpyTest()

                result = sut.spyOnMeAsIReverseThisString("G'day world")

                expect(result).toBe("dlrow yad'G")
            })

            it("shows how mocking an object does not impact its methods", () => {
                sut = new SpyTest()
                mockbox.prepareMock(sut)

                result = sut.spyOnMeAsIReverseThisString("G'day world")

                expect(result).toBe("dlrow yad'G")
            })

            it("shows how an object's callLog does not include non-mocked methods", () => {
                sut = new SpyTest()
                mockbox.prepareMock(sut)
                sut.$("mockMe")

                sut.spyOnMeAsIReverseThisString("G'day world")
                sut.mockMe()

                callLog = sut.$callLog()

                expect(callLog).toHaveKey("mockMe")
                expect(callLog).notToHaveKey("spyOnMeAsIReverseThisString")
            })

            it("shows how mocking a method prevents it from executing", () => {
                sut = new SpyTest()
                mockbox.prepareMock(sut)
                sut.$("spyOnMeAsIReverseThisString")

                result = sut.spyOnMeAsIReverseThisString("G'day world")

                expect(isNull(result)).toBeTrue()
            })

            it("shows how mocking a method with a callback as a replacement is a thing, and has a call log", () => {
                sut = new SpyTest()
                mockbox.prepareMock(sut)
                sut.$(
                    method = "spyOnMeAsIReverseThisString",
                    callback = (string) => {
                        return "from callback: #string#"
                    }
                )

                result = sut.spyOnMeAsIReverseThisString("G'day world")

                expect(result).toBe("from callback: G'day world")

                callLog = sut.$callLog()

                expect(callLog.spyOnMeAsIReverseThisString[1][1]).toBe("G'day world")
            })

            it("shows how spying a method leaves it operational, and has a call log", () => {
                sut = new SpyTest()
                mockbox.prepareMock(sut)
                sut.$spy("spyOnMeAsIReverseThisString")

                result = sut.spyOnMeAsIReverseThisString("G'day world")

                expect(result).toBe("dlrow yad'G")

                callLog = sut.$callLog()

                expect(callLog.spyOnMeAsIReverseThisString[1][1]).toBe("G'day world")
            })
        })
    }

    public string function spyOnMeAsIReverseThisString(required string stringToReverse) {
        return stringToReverse.reverse()
    }

    public void function mockMe() {
        throw "Test is invalid: this should be mocked-out"
    }
}
