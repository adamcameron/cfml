<cfscript>
isoDate = "2012-04-23T18:25:43.511Z";
writeOutput(isDate(isoDate));
writeOutput(isValid("date", isoDate));
writeOutput(dateFormat(isoDate));
</cfscript>