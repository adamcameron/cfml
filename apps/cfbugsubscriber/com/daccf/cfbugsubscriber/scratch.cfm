<cfscript>
myData = [
	{col="col1", value="one"},
	{col="col2", value="two"},
	{col="col3", value="three"}
];	
	
	
q = new Query(datasource="scratch_mysql");

sql = "UPDATE table SET ";
for (i=i; i <= arrayLen(myData); i++){
	// dunno what your data is, but you need a col and a value so let's pretend you have those
	q.addParam(value=myData[i].value);	// you might want a type here as well?
	sql &= " #myData[i].col# = ?";
	if (i < arrayLen(myData)){	
		sql &= ",";
	}
}
sql &= " WHERE cond=something";

q.setSql(sql);
q.execute();
</cfscript>