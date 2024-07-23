<cfstoredproc procedure="getRecords" datasource="scratch_mysql">
	<cfprocresult name="numbers" resultset="1">
	<cfprocresult name="months" resultset="2">
</cfstoredproc>

<cfscript>
start = getTickCount();
toSerialise = queryNew(numbers.columnList);
toSerialise.populate(numbers, numbers.recordCount);
serialised = objectSave(toSerialise);
writeOutput("Serialised: #getTickCount()-start#ms<br>");

start = getTickCount();
deserialised = objectLoad(serialised);
writeOutput("Deserialised: #getTickCount()-start#ms<br>");

writeDump([numbers,deserialised]);
</cfscript>
	