<cfscript>
    include "./tinyTestFramework.cfm";

    // tests
    void function run() {
        describe("Test of showResults()", () => {
            it("correctly outputs the expected results", () => {
                thisDir = getDirectoryFromPath(CGI.script_name)
                pathToSampleTests = thisDir & "sampleTests.cfm"
                urlToSampleTests = "http://localhost:#CGI.SERVER_PORT##pathToSampleTests#"

                cfhttp(method="get", url=urlToSampleTests, result="httpResponse");

                expect(httpResponse.statusCode).toBe("200 OK")

                expect(httpResponse.fileContent).toInclude('Pass: 4')
                expect(httpResponse.fileContent).toInclude('Fail: 5')
                expect(httpResponse.fileContent).toInclude('Error: 6')
                expect(httpResponse.fileContent).toInclude('Total: 15')
            })
        })
    }

    tinyTest.runTests()
</cfscript>
