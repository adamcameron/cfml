/**
* @hint Used in conjunction with bindTest.cfm
*/
component {
	remote struct function getData(string cfgridpage, string cfgridpagesize, string cfgridsortcolumn="name", string cfgridsortdirection="asc"){
		var q = queryNew("name,colour", "varchar,varchar");

		if (!len(trim(arguments.cfgridsortcolumn))){
			arguments.cfgridsortcolumn = "name";
		}
		if (!len(trim(arguments.cfgridsortdirection))){
			arguments.cfgridsortdirection = "asc";
		}
		
		queryAddRow(q); querySetCell(q, "name", "Andy"); querySetCell(q, "colour", "red");
		queryAddRow(q); querySetCell(q, "name", "Andy"); querySetCell(q, "colour", "green");
		queryAddRow(q); querySetCell(q, "name", "Andy"); querySetCell(q, "colour", "blue");
		queryAddRow(q); querySetCell(q, "name", "Belinda"); querySetCell(q, "colour", "red");
		queryAddRow(q); querySetCell(q, "name", "Belinda"); querySetCell(q, "colour", "gold");
		queryAddRow(q); querySetCell(q, "name", "Belinda"); querySetCell(q, "colour", "green");
		queryAddRow(q); querySetCell(q, "name", "Charlie"); querySetCell(q, "colour", "red");
		queryAddRow(q); querySetCell(q, "name", "Charlie"); querySetCell(q, "colour", "white");
		queryAddRow(q); querySetCell(q, "name", "Charlie"); querySetCell(q, "colour", "blue");
		queryAddRow(q); querySetCell(q, "name", "Denise"); querySetCell(q, "colour", "cyan");
		queryAddRow(q); querySetCell(q, "name", "Denise"); querySetCell(q, "colour", "magenta");
		queryAddRow(q); querySetCell(q, "name", "Denise"); querySetCell(q, "colour", "yellow");
		queryAddRow(q); querySetCell(q, "name", "Denise"); querySetCell(q, "colour", "black");
		queryAddRow(q); querySetCell(q, "name", "Ed"); querySetCell(q, "colour", "black");
		queryAddRow(q); querySetCell(q, "name", "Ed"); querySetCell(q, "colour", "white");
		
		request.q = q;
		
		q = new Query(dbtype="query", sql="select * from request.q order by #arguments.cfgridsortcolumn# #arguments.cfgridsortdirection#").execute().getResult();
		
		return QueryConvertForGrid(q, 1, q.recordCount);	
	}
}