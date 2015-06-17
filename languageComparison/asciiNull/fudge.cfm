<cfscript>
// fudge.cfm
s = "test" & urlDecode("%00");
writeOutput("string: [#s#]<br>");
writeOutput("length: [#len(s)#]<br>");
writeOutput("bytes: ");
arrayEach(
	listToArray(s,""),
	function(c){
		writeOutput(asc(c) & " ");
	}
);
</cfscript>