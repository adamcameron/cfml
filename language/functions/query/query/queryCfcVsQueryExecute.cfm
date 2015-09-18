<cfscript>
numbers = new Query(
	SQL = "
		select mi,en
		from numbers
		where id between :lo and :hi
	",
	parameters = [{value=3,name="lo"},{value=7,name="hi"}]
).execute().getResult();
writeDump(numbers);

numbers = queryExecute("
		select mi,en
		from numbers
		where id between :lo and :hi
	",
	{lo={value=3},hi={value=7}}
);
writeDump(numbers);

</cfscript>