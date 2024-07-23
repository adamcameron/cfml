<cfscript>
// finalComponent.cfm

finalComponent = new FinalComponent()
finalComponent.f()
echo("<hr>")
try {
	extendsFinalComponent = new ExtendsFinalComponent()
	extendsFinalComponent.f()
} catch (any e){
	echo("#e.type#<br>#e.message#<br>[#e.detail#]<br>")
}
</cfscript>