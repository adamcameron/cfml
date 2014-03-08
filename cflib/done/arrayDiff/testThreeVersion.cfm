<cfscript>
	param name="URL.threads" type="integer" default=0;

	a1 = deserializeJson(fileRead(expandPath("./1.js")));
	a2 = deserializeJson(fileRead(expandPath("./2.js")));

	include "arrayDiff.cfm";
	include "arrayDiffScriptV1.cfm";
	include "arrayDiffScriptV2.cfm";

	startTime = getTickCount();
	a3 = arrayDiff(array1=a1, array2=a2, threads=URL.threads, bRemoveDuplicates=false);
	endTime = getTickCount();
	writeOutput("Execution time: #endTime-startTime#ms<br />");
	writeOutput("#arrayLen(a3)#:#serializeJson(a3)#<br /><hr /><br />");
/* */

	startTime = getTickCount();
	a3 = arrayDiffV1(array1=a1, array2=a2, threads=URL.threads, bRemoveDuplicates=false);
	endTime = getTickCount();
	writeOutput("Execution time: #endTime-startTime#ms<br />");
	writeOutput("#arrayLen(a3)#:#serializeJson(a3)#<br /><hr /><br />");

	startTime = getTickCount();
	a3 = arrayDiffV2(array1=a1, array2=a2, threads=URL.threads, removeDuplicates=false);
	endTime = getTickCount();
	writeOutput("Execution time: #endTime-startTime#ms<br />");
	writeOutput("#arrayLen(a3)#:#serializeJson(a3)#<br /><hr /><br />");
/**/
</cfscript>