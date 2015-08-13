<cfscript>
// illegalDlsTime.cfm

include "../../safeRun.cfm";
safeRun("CFML: One minute before clocks go forward (valid time)", function(){
	legalTime = createDateTime(2016, 3, 27, 0, 59, 00);
	writeOutput("legalTime: #legalTime#");
});
safeRun("CFML: One minute after clocks go forward (invalid time)", function(){
	illegalTime = createDateTime(2016, 3, 27, 1, 01, 00);
	writeOutput("illegalTime: #illegalTime#");
});

safeRun("Java: One minute before clocks go forward (valid time)", function(){
	legalTime = createObject("java", "java.util.Date").init(116, 2, 27, 0, 59, 00);
	writeOutput("legalTime: #legalTime#");
});

safeRun("Java: One minute createDateTime clocks go forward (invalid time)", function(){
	illegalTime = createObject("java", "java.util.Date").init(116, 2, 27, 1, 01, 00);
	writeOutput("illegalTime: #illegalTime#");
});
</cfscript>