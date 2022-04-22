component extends=testbox.system.BaseSpec {

    function run() {
        describe("Tests of calllog behaviour", () => {
            it("is a control. Nothing mocked", () => {
                sut = new Sut()

                result = sut.runThis("RUN_THIS_ARG")

                expect(result).toBe("RUN_THIS_ARGabcde")
            })

            it("is a baseline. Everything mocked", () => {
                sut = new Sut()
                prepareMock(sut)
                sut.$("a").$results("MOCKED_A")
                sut.$("b").$results("MOCKED_B")
                sut.$("c").$results("MOCKED_C")
                sut.$("d").$results("MOCKED_D")
                sut.$("e").$results("MOCKED_E")

                result = sut.runThis("RUN_THIS_ARG")

                expect(result).toBe("MOCKED_E")

                callLog = sut.$callLog()
                expect(callLog.keyArray().sort("text")).toBe(["a", "b", "c", "d", "e"])
                expect(callLog.a[1]).toBe(["RUN_THIS_ARG"])
                expect(callLog.b[1]).toBe(["MOCKED_A"])
                expect(callLog.c[1]).toBe(["MOCKED_B"])
                expect(callLog.d[1]).toBe(["MOCKED_C"])
                expect(callLog.e[1]).toBe(["MOCKED_D"])
            })

            it("c mocked to throw an exception, so the later methods ain't called", () => {
                sut = new Sut()
                prepareMock(sut)
                sut.$("a").$results("MOCKED_A")
                sut.$("b").$results("MOCKED_B")
                sut.$("c").$throws(type="MockedException")
                sut.$("d").$results("MOCKED_D")
                sut.$("e").$results("MOCKED_E")

                expect(() => sut.runThis("RUN_THIS_ARG")).toThrow("MockedException")

                callLog = sut.$callLog()
                expect(callLog.keyArray().sort("text")).toBe(["a", "b", "c", "d", "e"])
                expect(callLog.a[1]).toBe(["RUN_THIS_ARG"])
                expect(callLog.b[1]).toBe(["MOCKED_A"])
                expect(callLog.c[1]).toBe(["MOCKED_B"])
                expect(callLog.d).toBeEmpty()
                expect(callLog.e).toBeEmpty()
            })
        })
    }
}
