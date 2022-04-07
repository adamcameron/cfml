<cfscript>
// isNull.cfm

param boolean URL.create = true;
if (URL.create){
	testVar = {
		subkey = {
			innerProperty = {
				actualValue =  "set"
			}
		}
	};
}

writeOutput("<h3>using structKeyExists():</h3>");
if (structKeyExists(variables, "testVar") && structKeyExists(variables.testVar, "subkey") && structKeyExists(variables.testVar.subkey, "innerProperty") && structKeyExists(variables.testVar.subkey.innerProperty, "actualValue")){
	writeOutput("it exists: #variables.testVar.subkey.innerProperty.actualValue#");
}else{
	writeOutput("it doesn't exist");
}
writeOutput("<hr>");

writeOutput("<h3>using isNull():</h3>");
if (!isNull(variables.testVar.subkey.innerProperty.actualValue)){
	writeOutput("it exists: #variables.testVar.subkey.innerProperty.actualValue#");
}else{
	writeOutput("it doesn't exist");
}
</cfscript>