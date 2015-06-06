<cfscript>
	startTime = getTickCount();
	s = "";
	for (i=1; i <= stringLength; i++){
		char = randRange(1, charsLen);
		s &= chars[char];
	}
	endTime = getTickCount();
</cfscript>