<cfscript>
// bypassFinalMethod.cfm

bypassFinalMethod = new BypassFinalMethod()
bypassFinalMethod.f()
echo("<hr>")

function f(){
	echo("UDF version<br>")
}
bypassFinalMethod.f = f

bypassFinalMethod.f()

</cfscript>