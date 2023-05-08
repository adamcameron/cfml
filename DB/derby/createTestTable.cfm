<cfquery datasource="scratch_derby">
	CREATE TABLE tbL_test (
		ID int,
		DATA varchar(50)
	)
</cfquery>

<cfquery datasource="">
	INSERT INTO tbL_test (
		id,
		data
	) VALUES (
		1,
		'one'
	)
</cfquery>
