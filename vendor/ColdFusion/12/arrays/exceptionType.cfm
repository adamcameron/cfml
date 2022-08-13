<cfscript>
haystack = ["tahi", "rua", "toru", "wha"];
needle = ["TORU"];

try{
	result = arrayFindNoCase(haystack, needle);
}catch (any e){
	writeOutput("arrayFindNoCase() throws: #e.type#<br>");
}
try{
	result = haystack.findNoCase(needle);
}catch (any e){
	writeOutput("Array.findNoCase() throws: #e.type#<br>");
}
</cfscript>