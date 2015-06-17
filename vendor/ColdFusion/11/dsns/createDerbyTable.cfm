<cfscript>
try {
	queryExecute("DROP TABLE numbers", [], {datasource="scratch_embedded"});
	queryExecute("
	CREATE TABLE numbers(
		id int NOT NULL GENERATED ALWAYS AS IDENTITY,
		en varchar(50),
		mi varchar(50),
		PRIMARY KEY (id)
	)", [], {
		datasource = "scratch_embedded"
	});
} catch (database ignore){
	// let's assume it exists
}
numbers = [
	{en="one", mi="tahi"},
	{en="two", mi="rua"},
	{en="three", mi="toru"},
	{en="four", mi="wha"},
	{en="five", mi="rima"},
	{en="six", mi="ono"},
	{en="seven", mi="whitu"},
	{en="eight", mi="waru"},
	{en="nine", mi="iwa"},
	{en="ten", mi="tekau"}
];

try {	
	numbers.each(function(v,i,a){
		queryExecute("INSERT INTO numbers (en, mi)VALUES(?, ?)", [v.en,v.mi], {datasource="scratch_embedded"});
	});
} catch (database ignore){
	// let's assume it's populated
}

writeDump(var=queryExecute("SELECT * FROM numbers ORDER BY id", [], {datasource="scratch_embedded"}));

</cfscript>