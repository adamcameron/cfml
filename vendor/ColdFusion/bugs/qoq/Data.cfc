component {

	remote query function getRecords(required numeric rows){
		var records = queryNew("id,version", "integer,varchar");	// I'm saying VARCHAR
		for (var i=1; i < rows; i++){
			queryAddRow(records);
			querySetCell(records, "id", i);
			querySetCell(records, "version", "9.0");				// could be numeric though
		}
		queryAddRow(records);
		querySetCell(records, "id", records.recordCount);
		querySetCell(records, "version", "9.0.1");					// def not numeric

		return records;
	}

}