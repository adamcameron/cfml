<cfscript>
	user = entityLoad("Account", {email="adamcameroncoldfusion@gmail.com", activationtoken="8E2A98AF-215D-AD32-CED37EBF5B01425As"}, true);
	writeDump(variables);
</cfscript>