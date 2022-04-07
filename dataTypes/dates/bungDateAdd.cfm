<cfscript>
	startDate		= createDateTime(2004,1,1,0,0,0);
	timeFrame		= structNew();
	timeFrame.hours	= structNew();
	timeFrame.date	= structNew();

	timeFrame.hours["1"] = 1;
	timeFrame.hours["2"] = 2;
	timeFrame.hours["3"] = 3;
	timeFrame.hours["4"] = 4;

	timeFrame.date["1"]	= startDate;
	timeFrame.date["2"]	= dateAdd("h", timeFrame.hours["1"], timeFrame.date["1"]);
	timeFrame.date["3"]	= dateAdd("h", timeFrame.hours["2"], timeFrame.date["2"]);
	timeFrame.date["4"]	= dateAdd("h", timeFrame.hours["3"], timeFrame.date["3"]);
	timeFrame.date["5"]	= dateAdd("h", timeFrame.hours["4"], timeFrame.date["4"]);
	
</cfscript>

<cfdump var="#timeFrame#">