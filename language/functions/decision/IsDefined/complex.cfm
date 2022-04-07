<cfscript>
a = [{
	key = "value"
}];

writeOutput(isDefined("a[1].key"));
writeOutput("<br>");
writeOutput(isDefined("a[1].keyOther"));
writeOutput("<br>");
writeOutput(isDefined("a[2]"));
writeOutput("<br>");
</cfscript>