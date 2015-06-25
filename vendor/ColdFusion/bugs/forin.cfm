<cfscript>
function getChars(){
	writeOutput("getChars() called (should see this ONCE)<br>");
	return ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'];
};

for (c in getChars()){
	writeOutput(c);
}
</cfscript>