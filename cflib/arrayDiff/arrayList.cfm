<cfscript>
	a1 = deserializeJson(fileRead(expandPath("./1.js")));
	a2 = deserializeJson(fileRead(expandPath("./2.js")));

	startTime = getTickCount();
	arrayList = createObject("java", "java.util.ArrayList").init(a1);
	endTime = getTickCount();
	writeOutput("Execution time: #endTime-startTime#ms<br />");

	writeOutput("Whole thing<br />");
	startTime = getTickCount();
	a1.removeAll(a2);
	endTime = getTickCount();
	writeOutput("Execution time: #endTime-startTime#ms<br />");

	writeOutput("Bits<br />");
	startTime = getTickCount();
	arrayList = createObject("java", "java.util.ArrayList").init(a1);
	final = createObject("java", "java.util.ArrayList").init();
	for (i=0; i <= arrayLen(arrayList); i +=2000){
		aTemp = arrayList.subList(i, i+1999);
		aTemp.removeAll(a2);
		final.addAll(aTemp);
	}
	endTime = getTickCount();
	writeOutput("Execution time: #endTime-startTime#ms<br />");
</cfscript>