<cfscript>
// doesNotCompile.cfm

try {
	x = (1+;
} catch (any e){
	writeOutput("That code didn't compile");	
}
</cfscript>