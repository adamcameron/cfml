<cfscript>
// bypassFinalMethod.cfm

bypassFinalMethod = new BypassFinalMethod()
bypassFinalMethod.f()
echo("<hr>")

function f(){
	echo("UDF version<br>")
}
bypassFinalMethod.f = f


try {
	bypassFinalMethod.f()
} catch (any e){
	echo("#e.type#<br>#e.message#<br>[#e.detail#]<br>")
}
</cfscript>