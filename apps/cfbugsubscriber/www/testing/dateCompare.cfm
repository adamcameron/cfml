<cfscript>
	firstDate = createDate(year(now()), month(now()), day(now()));
	secondDate = now();
	writeOutput("dateCompare(): " & dateCompare(firstDate, secondDate, "d") & "<br />");
	writeOutput("dateDiff(): " & dateDiff("d", firstDate, secondDate) & "<br />");
</cfscript>