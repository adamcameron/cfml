<cfscript>
	storedproc procedure="getSampleData" result="procResult" {
		procparam type="in" value=URL.low;
		procparam type="in" value=URL.high;
		procparam type="out" variable="tally";
		procresult resultset=1 name="numbers";
		procresult resultset=2 name="colours";
		procresult resultset=3 name="days";
	}

	dump(variables);
</cfscript>