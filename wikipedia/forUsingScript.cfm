<cfscript>
//forUsingScript.cfm

for (i=1; i <= 5; i++) {
	// statements
	writeOutput("#i#<br>");
}

writeOutput("<br><hr><br>");

for (i in [1,2,3,4,5]) {
	// statements
	writeOutput("#i#<br>");
}

writeOutput("<br><hr><br>");

loop index="i" list="1;2,3;4,5" delimiters=",;" {
	// statements
	writeOutput("#i#<br>");
}

writeOutput("<br><hr><br>");


loop index="i" from=1 to=5 {
	// statements
	writeOutput("#i#<br>");
}

writeOutput("<br><hr><br>");
</cfscript>