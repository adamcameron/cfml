<cfimport path="testbox.system.BaseSpec">
<cfimport path="cfmlInDocker.miscellaneous.tagsVsScriptDemonstrations.combinations.ScriptVersion">
<cfimport path="cfmlInDocker.miscellaneous.tagsVsScriptDemonstrations.combinations.TagsVersion">

<cfcomponent extends="BaseSpec" output="false">

    <cffunction name="beforeAll">
        <cfset variables.testArray = ["A", "B", "C", "D", "E"]>
        <cfset variables.expectedCombinations = [
            "AB", "AC", "AD", "AE",
            "BC", "BD", "BE",
            "CD", "CE",
            "DE"
        ]>
    </cffunction>

    <cffunction name="run">
        <cfset describe("Testing script version", testingScriptVersionHandler)>
        <cfset describe("Testing tags version", testingTagsVersionHandler)>
    </cffunction>

    <cffunction name="testingScriptVersionHandler">
        <cfset it("returns the expected combinations", returnsTheExpectedCombinationsScriptVersionHandler)>
    </cffunction>

    <cffunction name="returnsTheExpectedCombinationsScriptVersionHandler">
        <cfset sut = new ScriptVersion()>
        <cfset result = sut.getCombinations(variables.testArray)>

        <cfset expect(result).toBe(variables.expectedCombinations)>
    </cffunction>

    <cffunction name="testingTagsVersionHandler">
        <cfset it("returns the expected combinations", returnsTheExpectedCombinationsTagsVersionHandler)>
    </cffunction>

    <cffunction name="returnsTheExpectedCombinationsTagsVersionHandler">
        <cfset sut = new TagsVersion()>
        <cfset result = sut.getCombinations(variables.testArray)>

        <cfset expect(result).toBe(variables.expectedCombinations)>
    </cffunction>

</cfcomponent>
