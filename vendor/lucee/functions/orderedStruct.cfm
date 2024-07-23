<cfscript>
// orderedStruct.cfm

function f(required z, y, required x){
	writeDump(arguments);
}

writeOutput('Test 3: using an "ordered" struct<br>');

args = {3="value for x", 1="value for z"};
f(argumentCollection=args);

</cfscript>