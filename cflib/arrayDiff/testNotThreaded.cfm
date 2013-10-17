<cfscript>
	a1 = deserializeJson(fileRead(expandPath("./1.js")));
	a2 = deserializeJson(fileRead(expandPath("./2.js")));

	include "arrayDiffNotThreaded.cfm";
	startTime = getTickCount();
	a3 = arrayDiff(array1=a1, array2=a2, threads=0);
	endTime = getTickCount();

	writeOutput(serializeJson(a3) & "<br />");
	writeOutput("Execution time: #endTime-startTime#ms<br />");
</cfscript>