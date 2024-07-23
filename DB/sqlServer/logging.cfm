<cfscript>
digits = [1,2,3,4,5,6,7,8,9,10];
maoriNumbers = digits.map(
	function(id) {
		return queryExecute(
			"SELECT mi FROM numbers WHERE id = :id",
			{"id" = {cfsqltype="CF_SQL_INTERER", value=id}},
			{datasource = "scratch_mssql"}
		).mi;
	}
);
writeDump(maoriNumbers);
</cfscript>