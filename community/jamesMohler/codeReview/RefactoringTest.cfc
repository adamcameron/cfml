component extends="testbox.system.BaseSpec" {

	function beforeAll(){
		include "original.cfm";
		include "refactored.cfm";
	}

	function run(testResults, testBox){
		describe("Testing for regressions", function(){
			it("works with an empty struct", function(){
				var testStruct = {};
				var resultFromOriginal = passThrough(testStruct);
				var resultFromRefactored = extractCodeCentricAttributesToMarkupSafeAttributes(testStruct);
				expect(resultFromRefactored).toBe(resultFromOriginal);
			});
 			it("works with an irrelevant attribute", function(){
				var testStruct = {notRelevant=3};
				var resultFromOriginal = passThrough(testStruct);
				var resultFromRefactored = extractCodeCentricAttributesToMarkupSafeAttributes(testStruct);
				expect(resultFromRefactored).toBe(resultFromOriginal);
			});
			it("works with each of the relevant attributes", function(){
				var relevantAttributes = ["data-relevant", "onRelevant", "ng-relevant"];
				for (relevantAttribute in relevantAttributes) {
					var testStruct = {"#relevantAttribute#"=5};
					var resultFromOriginal = passThrough(testStruct);
					var resultFromRefactored = extractCodeCentricAttributesToMarkupSafeAttributes(testStruct);
					expect(resultFromRefactored).toBe(resultFromOriginal);
				}
			});
			it("works with a mix of attribute relevance", function(){
				var testStruct = {notRelevant=7, onRelevant=11};
				var resultFromOriginal = passThrough(testStruct);
				var resultFromRefactored = extractCodeCentricAttributesToMarkupSafeAttributes(testStruct);
				expect(resultFromRefactored).toBe(resultFromOriginal);
			});
			it("works with multiple relevant attributes", function(){
				var testStruct = {"data-relevant"=13, onRelevant=17, "ng-relevant"=19};
				var resultFromOriginal = passThrough(testStruct);
				var resultFromRefactored = extractCodeCentricAttributesToMarkupSafeAttributes(testStruct);
				expect(resultFromRefactored).toBe(resultFromOriginal);
			});
		});

	}

}