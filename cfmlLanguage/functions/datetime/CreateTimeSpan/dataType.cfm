<cfscript>
	d = createDate(2011, 3, 7);
	dt = createDateTime(2011, 3, 7, 22, 55,  42);
	ts = createTimeSpan(1, 2, 3, 4);
	
	public string function javaType(any o){
		return arguments.o.getClass().getName();
	}
	
	writeOutput("Date (#d#): #javaType(d)#<br />");
	writeOutput("Date/time (#dt#): #javaType(dt)#<br />");
	writeOutput("Timespan (#ts#): #javaType(ts)#<br />");
</cfscript>