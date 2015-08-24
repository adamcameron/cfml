<cfscript>
include "../../../safeRun.cfm";
safeRun("with null", function(){
	if (null){
		writeOutput("NULL was truthy");
	}else{
		writeOutput("NULL was falsey");
	}
});
safeRun("with javaCast()", function(){
	if (javaCast("null", "")){
		writeOutput("NULL was truthy");
	}else{
		writeOutput("NULL was falsey");
	}
});
safeRun("with variable", function(){
	var n = null;
	if (n){
		writeOutput("NULL was truthy");
	}else{
		writeOutput("NULL was falsey");
	}
});

</cfscript>