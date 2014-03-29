<cfscript>
stringToInspect = "!""##$%&'()*+,\-./:;<=>?@[\\\]^_`{|}~";

regex = "[[:punct:]]";
matches = reMatch(regex, stringToInspect);
writeDump(var=matches, label="Using #regex#");

regex = "[#stringToInspect#]";
matches = reMatch(regex, stringToInspect);
writeDump(var=matches, label="Using #regex#");
</cfscript>