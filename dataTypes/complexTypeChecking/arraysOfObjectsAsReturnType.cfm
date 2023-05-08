<cfscript>
// arraysOfObjectsAsReturnType.cfm

include "safeRun.cfm";

Test[] function returnsArrayOfTests(size){
	var baseArray = [];
	baseArray.set(1, size, new Test());
	return baseArray;
}

NotTest[] function returnsArrayOfNotTests(size){
	var baseArray = [];
	baseArray.set(1, size, new Test());
	return baseArray;
}

Test[] function returnsInvalidArrayOfTests(size){
	var baseArray = [];
	baseArray.set(1, size, new Test());
	baseArray.append(new NotTest());
	return baseArray;
}


safeRun("Array of Tests", function(){
	tests = returnsArrayOfTests(5);
	writeDump(tests);
});


safeRun("Array of NotTests", function(){
	tests = returnsArrayOfNotTests(5);
	writeDump(tests);
});

safeRun("Invalid array of Tests", function(){
	tests = returnsInvalidArrayOfTests(1);
	writeDump(tests);
});
</cfscript>