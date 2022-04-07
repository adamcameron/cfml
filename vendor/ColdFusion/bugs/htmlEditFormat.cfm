<cfscript>
// htmlEditFormat.cfm
original = fileRead(expandPath("./src.html"), "UTF-8");

encoded = htmlEditFormat(original);

function htmlDecode(HTML){
	return replaceList(arguments.HTML, "&lt;,&gt;,&amp;,&quot;", '<,>,&,"');
}
decoded = htmlDecode(encoded);

compared = compare(original,decoded);

if (compared != 0){
	loopTo = min(len(original), len(decoded));
	for (i=1; i <= loopTo; i++){
		cOriginal = mid(original, i, 1);
		cDecoded = mid(decoded, i, 1);
		match = cOriginal == cDecoded;
		writeOutput("#cOriginal#:#cDecoded# : (#asc(cOriginal)#:#asc(cDecoded)#): #match#<br>");

		if (!match){
			loopTo = min(i+10, loopTo);	// stop soon,but continue for a bit to give some context
		}

	}
}
writeOutput("<hr>");

loopTo = len(encoded);
for (i=1; i <= loopTo; i++){
	char = mid(encoded, i, 1);
	code = asc(char);
	writeOutput("#char#:#code#<br>");
	if (code == 10){
		loopTo = i + 5;
	}
}
</cfscript>
