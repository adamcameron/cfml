<cfscript>
	include "./current.cfm";
	include "./new.cfm";

	str = "This is my string with my home email address: cameron.adam@gmail.com, and my junk email address: adam.cameron.signup+junk@gmail.com. And some trailing text";
	currentVersion = scramail(str);
	newVersion = scramailNew(str);
	writeDump([
		{currentVersion=currentVersion},
		{newVersion=newVersion},
		{compare=compare(currentVersion,newVersion)}
	]);
	writeOutput("<hr>");
	writeOutput(currentVersion & "<br>");
	writeOutput(newVersion & "<br>");
</cfscript>