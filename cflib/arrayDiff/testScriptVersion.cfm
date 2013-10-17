<cfscript>
	a1 = deserializeJson(fileRead(expandPath("./1.js")));
	a2 = deserializeJson(fileRead(expandPath("./2.js")));

	include "arrayDiff.cfm";
	startTime = getTickCount();
	a3 = arrayDiff(array1=a1, array2=a2, threads=5, bRemoveDuplicates=false);
	endTime = getTickCount();
	writeOutput("Execution time: #endTime-startTime#ms<br />");

	startTime = getTickCount();
	a4 = arrayDiff(array1=a1, array2=a2, threads=5, bRemoveDuplicates=false);
	endTime = getTickCount();
	writeOutput("Execution time: #endTime-startTime#ms<br />");

	writeOutput("#arrayLen(a3)#:#serializeJson(a3)#<br />");
	writeOutput("#arrayLen(a4)#:#serializeJson(a4)#<br />");
</cfscript>