<cfscript>
CLI.writeLn(createDateTime(2012));
CLI.writeLn(createDateTime(2012, 11));
CLI.writeLn(createDateTime(2012, 11, 29));
CLI.writeLn(createDateTime(2012, 11, 29, 15));
CLI.writeLn(createDateTime(2012, 11, 29, 15, 7));
CLI.writeLn("============================");
ts = now();
CLI.writeLn(ts.setYear(2011));
CLI.writeLn(ts.setMonth(3));
CLI.writeLn(ts.setDay(24));
CLI.writeLn(ts.setHour(9));
CLI.writeLn(ts.setMinute(11));
CLI.writeLn(ts.setSecond(42));
</cfscript>