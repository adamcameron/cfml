<cfscript>
	param name="URL.items" type="numeric" default=0;

	a1 = [];
	a2 = [];
	for (i=1; i <= URL.items; i++){
		arrayAppend(a1, randRange(1, URL.items*10));
		arrayAppend(a2, i&"");
	}

	fileWrite(expandPath("./1.js"), serializeJson(a1));
	fileWrite(expandPath("./2.js"), serializeJson(a2));
</cfscript>