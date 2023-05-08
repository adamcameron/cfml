<cfscript>
	startTime = getTickCount();
	sb = createObject("java", "java.lang.StringBuffer").init(stringLength);
	for (i=1; i <= stringLength; i++){
		char = randRange(1, charsLen);
		sb.append(chars[char]);
	}
	s = sb.ToString();
	endTime = getTickCount();
</cfscript>