import testbox.system.BaseSpec

component extends=BaseSpec {

    function run() {
        describe("Tests the DB", () => {
            it("can connect to the DB", () => {
                result = queryExecute("SELECT CURDATE() AS `current_date`")
                expect(result).toHaveLength(1)
                expect(result).toHaveKey("current_date")
                expect(result.current_date[1]).toBe(now().dateFormat("YYYY-MM-DD"))
            })
        })
    }
}
