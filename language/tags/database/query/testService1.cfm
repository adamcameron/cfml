<cfscript>
	oQuery = new Query();
	oQuery.setSql("
		select		*
		from		tbl_person
		order by	prs_id
	");
	oQuery.setDataSource("scratch");
	r = oQuery.execute();
	writeDump(r.getResult());
</cfscript>

