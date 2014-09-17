<cfscript>
// getFunctionCalledName.cfm

function f(){
	echo("#getFunctionCalledName()#() called<br>");
}

f();
echo("<hr>");

g = f;
g();
</cfscript>