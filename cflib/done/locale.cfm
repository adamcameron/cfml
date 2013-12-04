<cfscript>
	locales = listToArray(server.coldFusion.supportedLocales);
	arraySort(locales, "textnocase");
	for (locale in locales){
		writeOutput("#locale#<br>");
	}
</cfscript>