

<cfscript>
	stMem = getJvmMemory();
	writeOutput('<span style="font-family:courier;">');
	writeOutput("Max:&nbsp;&nbsp; [#stMem.max#]<br />");
	writeOutput("Total: [#stMem.total#]<br />");
	writeOutput("Free:&nbsp; [#stMem.free#]<br />");
	writeOutput("Used:&nbsp; [#stMem.used#] [#stMem.usedPercent#%]<br />");
	writeOutput('</span>');
</cfscript>

