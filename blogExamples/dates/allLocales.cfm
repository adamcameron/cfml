<cfscript>
	locales = createObject("java", "java.util.Locale").getAvailableLocales();
	for (locale in locales){
		sdf = createObject("java", "java.text.SimpleDateFormat").init();
		defaultFormat = sdf.getDateInstance(sdf.DEFAULT, locale);
		shortFormat = sdf.getDateInstance(sdf.SHORT, locale);
		mediumFormat = sdf.getDateInstance(sdf.MEDIUM, locale);
		longFormat = sdf.getDateInstance(sdf.LONG, locale);
		fullFormat = sdf.getDateInstance(sdf.FULL, locale);

		writeOutput("<h4>#locale.getDisplayName()#</h4>");
		writeOutput("Default: #defaultFormat.toLocalizedPattern()#<br>");
		writeOutput("Short: #shortFormat.toLocalizedPattern()#<br>");
		writeOutput("Medium: #mediumFormat.toLocalizedPattern()#<br>");
		writeOutput("Long: #longFormat.toLocalizedPattern()#<br>");
		writeOutput("Full: #fullFormat.toLocalizedPattern()#<hr>");
	}
		
</cfscript>