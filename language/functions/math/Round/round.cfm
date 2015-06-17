<cfscript>
	f1 = 4.475;
	writeOutput("f1 = 4.475: [#f1#]<br />");
	f2 = f1 * 100;
	writeOutput("f2 = #f1# * 100: [#f2#]<br />");
	f3 = round(f2);
	writeOutput("f3 = round(#f2#): [#f3#]*** wrong<br />");
	f4 = f3 / 100;
	writeOutput("f4 = #f3# / 100: [#f4#]<br />");

	writeOutput("<hr />");

	f5 = round(447.5);
	writeOutput("round(447.5): [#f5#]*** right<br />");
</cfscript>
