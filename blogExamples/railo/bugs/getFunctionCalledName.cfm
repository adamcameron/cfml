<cfscript>
// getFunctionCalledName.cfm

function f(){
	writeOutput("Function was called as #getFunctionCalledName()#<br>");
}
g = f;

f();
g();
	
</cfscript>