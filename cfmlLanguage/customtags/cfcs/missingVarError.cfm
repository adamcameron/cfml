<cfscript>
// missingVarError.cfm
try {
echo(variables.message)
}
catch(any e){
	dump(e)
}
</cfscript>