<cfprocessingdirective pageencoding="UTF-8">
<cfscript>
	q1 = queryNew("");
	queryAddColumn(q1, "id", [1,2,3,4,5,6,7]);
	queryAddColumn(q1, "daysofWeek", ["Rāhina","Rātū","Rāapa","Rāpare","Rāmere","Rāhoroi","Rātapu"]);
	queryAddColumn(q1, "ts", [now(),now(),now(),now(),now(),now(),now()]);

	o = new Query(
		dbtype	= "query",
		sql		= "
			SELECT	*
			FROM	q1
			WHERE	daysofWeek = #now()#
		"
	);

	o.setAttributes(q1=q1);

	o.execute();
	q2 = o.getResult();

	writeDump(variables);
</cfscript>