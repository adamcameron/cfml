<cfscript>
include "../../safeRun.cfm";
	safeRun("One minute before clocks go forward (valid time)", function(){
		legalTime = createDateTime(2016, 3, 27, 0, 59, 00);
	});
	safeRun("One minute after clocks go forward (invalid time)", function(){
		illegalTime = createDateTime(2016, 3, 27, 1, 01, 00);
	});
</cfscript>