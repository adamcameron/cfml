<cfscript>
	include "./current.cfm";
	include "./new.cfm";

	emailAddresses = "cameron.adam@gmail.com,adam.cameron.signup+test@gmail.com";
	currentVersion = scramail(emailAddresses);
	newVersion = scramailNew(emailAddresses);
	writeDump([
		{currentVersion=currentVersion},
		{newVersion=newVersion},
		{compare=compare(currentVersion,newVersion)}
	]);
	writeOutput("<hr>");
	writeOutput(currentVersion & "<br>");
	writeOutput(newVersion & "<br>");
</cfscript>