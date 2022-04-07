<cfscript>
	try{
		writeOutput("Trying CFMX7 way.<br />");
		qCacheQuery		= queryNew("scope,lang,hash,key,cacheTime,size,path","CF_SQL_VARCHAR, CF_SQL_VARCHAR, CF_SQL_VARCHAR,CF_SQL_VARCHAR,CF_SQL_VARCHAR,CF_SQL_VARCHAR,CF_SQL_VARCHAR");
		writeOutput("CFMX7 way succeeded.<br />");
	} catch(any ex){
		//that failed... CF6 way
		writeOutput("CFMX7 way failed [#ex.message#].<br />");
		writeOutput("Trying CFMX6 way.<br />");
		qCacheQuery		= queryNew("scope,lang,hash,key,cacheTime,size,path");
		writeOutput("CFMX6 way succeeded.<br />");
	}
</cfscript>