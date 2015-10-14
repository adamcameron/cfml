<cfscript>
colours = queryExecute("SELECT * FROM hasnulls",[],{datasource="scratch_mysql"});
	
writeDump(isNull(colours.en[1]));	

nonNullMaoriColours = queryExecute("SELECT * FROM colours WHERE mi IS NOT NULL",[],{dbtype="query",colours=colours});
writeDump(nonNullMaoriColours);
</cfscript>