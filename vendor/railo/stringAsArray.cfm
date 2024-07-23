<cfscript>
// stringAsArray.cfm
s = "G'day world";
for (i=1; i <= s.length(); i++){
	writeOutput(s[i]);
}
writeOutput("<hr>");

charAfterApostrophe = s[find("'", s)+1];
writeOutput("charAfterApostrophe: #charAfterApostrophe#");
</cfscript>