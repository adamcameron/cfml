<cfscript>
	param name="URL.size" type="integer" default=0;
	
	a = [];
	l = "";
	for (i=1; i <= URL.size; i++){
		element = createUuid();
		arrayAppend(a, element);
		l = listAppend(l, element);
	}
	
	which = randRange(1, URL.size);
	value = a[which];

	startTime = getTickCount();
	listResult = listFind(l, value);
	listTime = getTickCount() - startTime;

	startTime = getTickCount();
	arrayResult = arrayFind(a, value);
	arrayTime = getTickCount() - startTime;

	startTime = getTickCount();
	vectorResult = a.indexOf(value) + 1;
	vectorTime = getTickCount() - startTime;
	
	writeDump({
		which	= which,
		value	= value,
		results	= {
			list	= listResult,
			array	= arrayResult,
			vector	= vectorResult
		},
		times	= {
			list	= listTime,
			array	= arrayTime,
			vector	= vectorTime
		}
	});
</cfscript>