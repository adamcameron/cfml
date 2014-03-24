<cfscript>
	a = [];
	for (i=URL.elements; i > 0 ; i--){
		arrayAppend(a, i);
	}
	echo(arrayToList(a))
</cfscript>