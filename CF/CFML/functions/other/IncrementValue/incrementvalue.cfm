
<cfflush interval="10">

<cfscript>
	a = "";
	iteration = 50000;
	testcount = 20;

	testa = 0;
	testb = 0;

	WriteOutput("Iterations: #iteration#<br>");

	for (j = 1; j lte testcount; j = j + 1)
	{
		WriteOutput("<b>Loop Test:</b> #j# of #testcount#<br>");
		testa = testa + incrementStatement();
		testb = testb + incrementFunction();
	}

	testa = testa / testcount;
	testb = testb / testcount;

	WriteOutput("<hr>");
	WriteOutput("<b>i = i + 1 -> Average Time:</b> #testa#ms<br>");
	WriteOutput("<b>i = IncrementValue(i) -> Average Time:</b> #testb#ms<br>");
	WriteOutput("<hr>");

	if (testa gt testb)
	{
		result = 100 - (testb / testa * 100);
		WriteOutput("<b>i = IncrementValue(i) is faster than i = i + 1 by 
#result#%.</b>");
	}
	else if (testb gt testa)
	{
		result = 100 - (testa / testb * 100);
		WriteOutput("<b>i = i + 1 is faster than i = IncrementValue(i) by 
#result#%.</b>");
	}
	else
	{
		WriteOutput("<b>i = IncrementValue(i) is the same speed as i = i + 
1.</b>");
	}

	function incrementStatement()
	{
		startTime = GetTickCount();
		for (i=1; i lte iteration; i = i + 1)
			a = "1";

		endTime = GetTickCount() - startTime;
		WriteOutput("i = i + 1 -> #endTime#ms <br>");
		return endTime;
	}

	function incrementFunction()
	{
		startTime = GetTickCount();
		for (i=1; i lte iteration; i = IncrementValue(i))
			a = "1";

		endTime = GetTickCount() - startTime;
		WriteOutput("i = IncrementValue(i) -> #endTime#ms <br>");
		return endTime;
	}
</cfscript>
