<cfscript>
	dbData = new Query(sql="SELECT * FROM tbl_dates", datasource="scratch_mysql").execute().getResult();
	results = {
		now					= valueAndType(now()),
		createDate			= valueAndType(createDate(2012, 12, 1)),
		createDateTime		= valueAndType(createDateTime(2012, 12, 1, 9, 15, 15)),
		createOdbcDateTime	= valueAndType(createOdbcDateTime(now())),
		parseDateTime		= valueAndType(parseDateTime("2012-12-01 09:17:18")),
		lsParseDateTime		= valueAndType(lsParseDateTime("2012-12-01 09:17:18")),
		dateTimeCol			= valueAndType(dbData.dateTimeCol[1]),
		dateCol				= valueAndType(dbData.dateCol[1]),
		timeCol				= valueAndType(dbData.timeCol[1]),
		timestampCol		= valueAndType(dbData.timestampCol[1])
	};
	writeDump(results);
	
	struct function valueAndType(obj){
		return {
			value	= obj,
			class	= obj.getClass().getName()
		};
	}
</cfscript>