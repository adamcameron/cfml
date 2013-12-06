<cfscript>
	supportedLocales = server.coldfusion.supportedlocales;
	unSupportedLocales = [];

	locales = createObject("java", "java.util.Locale").getAvailableLocales();
	for (locale in locales){
		localeName = locale.getDisplayName();
		languageTag = locale.toLanguageTag();
		cfmlLanguageTag = replace(languageTag, "-", "_", "ONE");

		if (!listFindNoCase(supportedLocales, cfmlLanguageTag)){
			arrayAppend(unSupportedLocales, localeName);
			continue;
		}

		sdf = createObject("java", "java.text.SimpleDateFormat").init();
		defaultFormat = sdf.getDateInstance(sdf.DEFAULT, locale);
		shortFormat = sdf.getDateInstance(sdf.SHORT, locale);
		mediumFormat = sdf.getDateInstance(sdf.MEDIUM, locale);
		longFormat = sdf.getDateInstance(sdf.LONG, locale);
		fullFormat = sdf.getDateInstance(sdf.FULL, locale);

		writeOutput("<h4>#localeName#</h4>");
		writeOutput("<h3>Locale info</h4>");
		writeOutput("Display Country: #locale.getDisplayCountry()#<br>");
		writeOutput("Display Language: #locale.getDisplayLanguage()#<br>");
		writeOutput("Display Script: #locale.getDisplayScript()#<br>");
		writeOutput("Display Variant: #locale.getDisplayVariant()#<br>");
		writeOutput("Display ISO3 Language: #locale.getISO3Language()#<br>");
		writeOutput("Language: #locale.getLanguage()#<br>");
		writeOutput("Variant: #locale.getVariant()#<br>");
		writeOutput("Language Tag: #languageTag#<br>");

		writeOutput("<h3>Date info</h4>");
		writeOutput("Default: #defaultFormat.toLocalizedPattern()#<br>");
		writeOutput("Short: #shortFormat.toLocalizedPattern()#<br>");
		writeOutput("Medium: #mediumFormat.toLocalizedPattern()#<br>");
		writeOutput("Long: #longFormat.toLocalizedPattern()#<br>");
		writeOutput("Full: #fullFormat.toLocalizedPattern()#<hr>");
	}
	writeDump(var=unSupportedLocales, label="Java locales unsupported by ColdFusion");
</cfscript>