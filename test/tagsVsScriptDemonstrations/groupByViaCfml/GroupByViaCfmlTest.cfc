import cfmlInDocker.miscellaneous.tagsVsScriptDemonstrations.groupByViaCfml.ScriptVersion
import cfmlInDocker.miscellaneous.tagsVsScriptDemonstrations.groupByViaCfml.TagsVersion

component extends=testbox.system.BaseSpec {

    function run() {
        describe("Testing group-by via CFML script version", () => {
            it("groups the rows by year and month correctly", () => {
                ungroupedRecords = getUngroupedRecords()
                expectedGroupedRecords = getGroupedRecords()

                sut = new ScriptVersion()
                groupedRecords = sut.groupByYearAndMonth(ungroupedRecords)
                expect(serializeJson(groupedRecords)).toBe(serializeJson(expectedGroupedRecords))
            })
        })
        describe("Testing group-by via CFML tag version", () => {
            it("groups the rows by year and month correctly", () => {
                ungroupedRecords = getUngroupedRecords()
                expectedGroupedRecords = getGroupedRecords()

                sut = new TagsVersion()
                groupedRecords = sut.groupByYearAndMonth(ungroupedRecords)
                expect(serializeJson(groupedRecords)).toBe(serializeJson(expectedGroupedRecords))
            })
        })
    }

    private query function getUngroupedRecords() {
        wddx = fileRead("#getThisDirectory()#/ungroupedRecords.wddx")
        wddx action="wddx2cfml" input=wddx output="query";
        return query
    }

    private query function getGroupedRecords() {
        wddx = fileRead("#getThisDirectory()#/groupedRecords.wddx")
        wddx action="wddx2cfml" input=wddx output="query";
        return query
    }

    private string function getThisDirectory() {
        return getDirectoryFromPath(getCurrentTemplatePath())
    }
}
