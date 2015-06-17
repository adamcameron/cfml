<cfscript>
	// init
	sSrc		= "cab";
	sPattern = ("(?<=a)b");


	// JAVA
	writeOutput("<strong>Trying with Java</strong><br />");
	oPattern = createObject("java", "java.util.regex.Pattern").Compile(sPattern);
	oMatcher = oPattern.Matcher(sSrc);
	bFind = oMatcher.Find();
	if (bFind){
		sResult = oMatcher.Group();
		writeOutput("Found it");
	}else{
		writeOutput("No joy");
	}
	writeOutput("<br /><hr/>");

	// CF
	writeOutput("<strong>Trying with CF</strong><br />");
	try {
		bFind = reFind(spattern, sSrc);
		if (bFind){
			sResult = oMatcher.Group();
			writeOutput("Found it");
		}else{
			writeOutput("No joy");
		}
	} catch(any e){
		writeOutput("CF choked on the regex: [#e.message#][#e.detail#]");
	}
</cfscript>
