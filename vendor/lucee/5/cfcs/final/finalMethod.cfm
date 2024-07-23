<cfscript>
// finalMethod.cfm

finalMethod = new FinalMethod()
finalMethod.f()
echo("<hr>")
try {
	extendsFinalMethod = new ExtendsFinalMethod()
	extendsFinalMethod.f()
} catch (any e){
	echo("#e.type#<br>#e.message#<br>[#e.detail#]<br>")
}
</cfscript>