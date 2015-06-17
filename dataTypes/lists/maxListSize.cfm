<cfscript>
	l = "";
	for (i=1; i le 2000; i=i+1){
		l = listAppend(l, i);
	}

	for (i=1; i le 2000; i=i+1){
		writeOutput("List element [#i#]: #listGetAt(l, i)#<br />");
	}
</cfscript>