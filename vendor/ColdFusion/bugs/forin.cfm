<cfscript>
function getChars(){
	writeOutput("getChars() called (should see this ONCE)<br>");
	return ["a", "b", "c"];
}

for (c in getChars()){
	writeOutput("#c#<br>");
}
</cfscript>