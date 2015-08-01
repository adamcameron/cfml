<cfscript>
// falseNull.cfm

include "../../../safeRun.cfm";

function nuller(){
	return;
};


safeRun("is null boolean false", function(){
	result = nuller() ? true : false;
	writeOutput("Null was: #result#<br>");
});

safeRun("?: with false", function(){
	result = false ?: "default";
	writeOutput("Testing false resulted in: #result#<br>");
});

safeRun("?: with null", function(){
	result = nuller() ?: "default";
	writeOutput("Testing null resulted in: #result#<br>");
});


</cfscript>