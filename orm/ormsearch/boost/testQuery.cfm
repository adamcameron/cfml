<cfscript>
	param name="URL.name";
	iStart = getTickCount();
	oPeople = new Query(sql="SELECT * from tbl_people WHERE ppl_firstname=? ORDER BY ppl_lastname DESC");
	oPeople.addParam(value="#URL.name#", cfsqltype="CF_SQL_VARCHAR");
	qPeople = oPeople.execute().getResult();
	writeDump(var=qPeople, label="Execution Time: #getTickCount()-iStart#ms");
</cfscript>