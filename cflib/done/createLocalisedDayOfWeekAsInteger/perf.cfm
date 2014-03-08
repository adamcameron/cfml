<cfscript>
	// perf.cfm

	include "createLocalisedDayOfWeekAsInteger.cfm";

	param numeric URL.iterations = 0;

	start = getTickCount();
	for (i=1; i <= URL.iterations; i++){
		f = createLocalisedDayOfWeekAsInteger("EN_NZ");
	}
	finish = getTickCount();
	executionTime = finish - start;
	writeOutput("Execution time for #URL.iterations# iterations: #executionTime#<hr>");

	localisedDayOfWeekAsInteger = createLocalisedDayOfWeekAsInteger("EN_NZ");
	days = ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"];
	start = getTickCount();
	for (i=1; i <= URL.iterations; i++){
		localisedDayOfWeekAsInteger(days[(i MOD 7) + 1]);
	}
	finish = getTickCount();
	executionTime = finish - start;
	writeOutput("Execution time for #URL.iterations# iterations: #executionTime#<hr>");
</cfscript>