<cfscript>
function htmlDecode(HTML){
	return replaceList(arguments.HTML, "&lt;,&gt;,&amp;,&quot;", '<,>,&,"');
}


original = fileRead(expandPath("/html/onclick_html5.html"), "UTF-8");
encoded = htmlEditFormat(original);
decoded =  htmlDecode(encoded);

original = reReplace(original, "\r|\n", "", "ALL");
decoded = reReplace(decoded, "\r|\n", "", "ALL");

same = compare(original,decoded);

if (same){
	loopTo = min(len(original), len(decoded));
	for (i=1; i <= loopTo; i++){
		cOriginal = mid(original, i, 1);
		cDecoded = mid(decoded, i, 1);
		writeOutput("#cOriginal# (#asc(cOriginal)#): #cDecoded# (#asc(cDecoded)#): #cOriginal EQ cDecoded#<br>");
	}
}

writeDump([
original,
encoded,
decoded,
same,
[len(original), len(encoded), len(decoded)]
]);

</cfscript>