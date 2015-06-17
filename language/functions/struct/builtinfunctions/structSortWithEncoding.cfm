<cfscript>
// structSortWithEncoding.cfm
it("returns an array of keys sorted by locale-aware string value", function(){
	var testStruct = {tt="tta", Eszett="ßa", lc="ssc", rr="rra", uc="SSb"};
	var result = structSort(testStruct, "TEXTNOCASE", "ASC", "", true);
	expect(result).toBe(["rr","Eszett","uc","lc","tt"]);
});
</cfscript>