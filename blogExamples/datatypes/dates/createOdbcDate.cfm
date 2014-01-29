<cfscript>
//createOdbcDate.cfm
d1 = createODBCDate(now());
sleep(5000);
d2 = createODBCDate(now());

writeDump(var=[
	{d1=d1},
	{d2=d2},
	{"d1==d2" = d1==d2},
	{'dateDiff("s", d1, d2)' = dateDiff("s", d1, d2)},
	{"d2-d1" = d2-d1},
	{"d1.getHours()" = d1.getHours()},
	{"d1.getMinutes()" = d1.getMinutes()},
	{"d1.getSeconds()" = d1.getSeconds()}
]);

</cfscript>