<cfscript>
// arraysOfObejctsAsArgs.cfm

include "safeRun.cfm";

function takesArrayOfTests(Test[] tests){
	return tests.len();
}

safeRun("Array of Tests", function(){
	takesArrayOfTests([new Test()]);
});

safeRun("Array of NotTests", function(){
	tests = takesArrayOfTests([new NotTest()]);
});

safeRun("Invalid array of Tests", function(){
	tests = takesArrayOfTests([new Test(), new NotTest()]);
});
</cfscript>

<!--- <cffunction name="takesArrayOfTests">
	<cfargument name="tests" type="Test[]">
	<cfreturn tests.len()>
</cffunction> --->

