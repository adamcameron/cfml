<cfscript>
	rainbow = queryNew("");
	queryAddColumn(rainbow, "id", "integer", [1,2,3,4,5,6,7]);
	queryAddColumn(rainbow, "maori", "varchar", ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"]);
	queryAddColumn(rainbow, "english", "varchar", ["red","orange","yellow","green","blue","indigo","violet"]);

	writeDump(rainbow);

	queryingService = new Query(argumentCollection={
		dbtype	= "query",
		rainbow	= rainbow,
		sql		= "
			SELECT	*
			FROM	rainbow
			WHERE	id = ?
		"
	});
	queryingService.addParam(value=URL.id, cfsqltype="CF_SQL_INTEGER");
	
	result = queryingService.execute().getResult();
	writeDump(variables);
</cfscript>