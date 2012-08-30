<cfscript>
	o = new Object("value");
	a = [o];
	
	writeOutput("Same object: " & arrayContains(a, o) & "<br />");
	writeOutput("Duplicated object: " & arrayContains(a, duplicate(o)) & "<br />");
	writeOutput("New object inline: " & arrayContains(a, new Object("value")) & "<br />");
	o2 = new Object("value");
	writeOutput("New object via variable: " & arrayContains(a, o2) & "<br />");
</cfscript>