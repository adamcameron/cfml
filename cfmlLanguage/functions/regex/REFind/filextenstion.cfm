<cfscript>
	sPath			= "\\adam\c$\temp\foo.";
	rFind		= "(.*\.)(.*)$";
	rReplace	= "\2";

	sReplace	= REReplace(sPath, "(.*\.)(.*)$", "\2");
	writeOutput("Result: [#sReplace#]<br />");
	
	aMatch = REFind(rFind, sPath, 1, true);

	for (i=1; i le arrayLen(aMatch.pos); i=i+1){
		writeOutput("[#i#] [#mid(sPath, aMatch.pos[i], aMatch.len[i])#]<br />");
	}
</cfscript>
<cfdump var="#aMatch#">