import testbox.system.BaseSpec
import cfmlInDocker.miscellaneous.mockExampleApp.*

component extends=BaseSpec {

    function beforeAll() {
        variables.mockedDao = prepareMock(object=new NumberDao(), callLogging=true)
        variables.numberController = new NumberController(new NumberFactory(variables.mockedDao))
    }

    function run() {
        describe("Testing handlePost variants", () => {
            it("passes the expected values to the DB", () => {
                valuesToSave = {english="two", maori="rua"}

                variables.mockedDao.$(method="insert", calllogging=true)

                response = variables.numberController.handlePost({english="two", maori="rua"})
                expect(response).toBeInstanceOf("cfmlInDocker.miscellaneous.mockExampleApp.Response")
                expect(response.statusCode).toBe(201)

                callLog = variables.mockedDao.$callLog()
                expect(callLog).toHaveKey("insert")
                expect(callLog.insert).toHaveLength(1)
                expect(callLog.insert[1]).toBe(["two", "rua"])
            })

            it("throws expected exception when there are validation issues", () => {
                variables.mockedDao.$(method="insert", calllogging=true)

                response = variables.numberController.handlePost({})
                expect(response).toBeInstanceOf("cfmlInDocker.miscellaneous.mockExampleApp.ClientErrorResponse")
                expect(response.statusCode).toBe(400)
                expect(response.errors).toBe([
                    "english is required",
                    "maori is required"
                ])

                callLog = variables.mockedDao.$callLog()
                expect(callLog).toHaveKey("insert")
                expect(callLog.insert).toBeArray()
                expect(callLog.insert).toBeEmpty()
            })
        })
    }
}
