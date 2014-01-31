<cfscript>
// odbcDateAndTimeFunctions.cfm
param name="URL.dateType" type="string";

function createTestObject(required string dateType, required date date){
	return evaluate("createOdbc#dateType#(date)"); // reasonable use of evaluate()!
}


d1 = createTestObject(URL.dateType, now());
sleep(5000);
d2 = createTestObject(URL.dateType, now());

writeDump(var=[
	{"d1.getClass().getName()"=d1.getClass().getName()},
	{d1=d1},
	{d2=d2},
	{"d1==d2" = d1==d2},
	{'dateDiff("s", d1, d2)' = dateDiff("s", d1, d2)},
	{"d2-d1" = d2-d1},
	{"d1.getHours()" = d1.getHours()},
	{"d1.getMinutes()" = d1.getMinutes()},
	{"d1.getSeconds()" = d1.getSeconds()},
	{"d1.toString()" = d1.toString()}
], label="Using createOdbc#URL.dateType#()");
</cfscript>