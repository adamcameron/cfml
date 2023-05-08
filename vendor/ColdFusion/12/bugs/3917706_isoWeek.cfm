<cfscript>
testDate = parseDateTime(CLI.getArg(1));
	
CLI.writeLn("week(): #week(testDate)#");
CLI.writeLn("week() with ISO: #week(testDate, 'ISO')#");
</cfscript>