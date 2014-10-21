<cfscript>
num = 56;

function f(){
	writeOutput("At top: #num?:'UNDEFINED'#");
	var num = 10;
	writeOutput("At bottom: #num?:'UNDEFINED'#");
}
f();
</cfscript>
