<cfscript>
haystack = "We will try to find all the four letter words in this sentence.";
pattern = "\b((\w{2})(\w{2}))\b";
results = haystack.reFind(pattern, 1, true, "ALL");
writeOutput(serializeJson(results));
</cfscript>