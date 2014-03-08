<cfflush interval="16">
<cfscript>
	a1 = deserializeJson(fileRead(expandPath("./1.js")));
	a2 = deserializeJson(fileRead(expandPath("./2.js")));

	startTime = getTickCount();
	size	= arrayLen(a1);
	parts	= 5;
	partSize = ceiling(size/parts);

	final = [];

	for (i=0; i < size; i += partSize){
		from = i;
		to = min(size, i+partSize);
		sub = duplicate(a1.subList(from, to));
		sub.removeAll(a2);
		final.addAll(sub);
	}
	endTime = getTickCount();
	writeOutput("Execution time: #endTime-startTime#ms<br />");

	writeOutput("#arrayLen(final)#:#serializeJson(final)#<br />");
</cfscript>