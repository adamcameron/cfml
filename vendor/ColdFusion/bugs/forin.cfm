<cfscript>
function getChars(){
	writeOutput("getArray() called<br>");
	return ["a", "b", "c"];
}

for (c in getChars()){
	writeOutput("#c#<br>");
}
</cfscript>