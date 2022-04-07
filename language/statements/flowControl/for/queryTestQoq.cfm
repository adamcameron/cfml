<cfquery name="q" datasource="scratch_mysql">
	SELECT	*
	FROM	t_users
</cfquery>

<cfquery name="q2" dbtype="query">
	SELECT		*
	FROM		q
	ORDER BY	usr_lastname DESC
</cfquery>

<cfscript>
	for (st in q2){
		writeDump(st);
	}
	writeDump(variables);
</cfscript>