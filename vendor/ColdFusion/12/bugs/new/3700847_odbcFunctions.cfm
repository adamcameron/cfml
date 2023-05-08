<cfscript>
ts = now();
odbc = createOdbcDate(ts);
to_s = odbc.toString();
y = odbc.getYear();
m = odbc.getMonth();
d = odbc.getDate();
writeDump(variables);

odbc = createOdbcTime(ts);
to_s = odbc.toString();
y = odbc.getYear();
m = odbc.getMonth();
d = odbc.getDate();
writeDump(variables);


odbc = createOdbcDateTime(ts);
to_s = odbc.toString();
y = odbc.getYear();
m = odbc.getMonth();
d = odbc.getDate();
writeDump(variables);

</cfscript>