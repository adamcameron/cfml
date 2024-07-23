<cfscript>
function iterate(query, rowHandler){


	var group = function(column, groupHandler){
		var doGroup = (i == 1) || (previous[column] != row[column]);
		if (doGroup){
			var groupContent = "";
			savecontent variable="groupContent" {
				groupHandler(row, i);
			}
			rowContent.append({group=column, groupContent=groupContent});
		}
	};


	var previous = {};
	for(var i=1; i <= query.recordCount; i++){
		var rowContent = [];
		var row = query.getRow(i);
		rowHandler(row, i, group);
		previous = row;


		rowOutput = rowContent.reduce(function(rowOutput, groupOutput, index){
			if (index == 1) return groupOutput.groupContent;
			return rowOutput.replace("{#groupOutput.group#}", groupOutput.groupContent, "all");
		}, "");

		writeDump(rowContent);
		writeOutput(rowOutput);
	}


}





personnel = new Personnel().get();

iterate(personnel, function(row, i, group){
	group("country", function(row, i){
		writeOutput("<h2>#row.country#</h2>");
		writeOutput("{region}");
		writeOutput("<hr>");
	});
	group("region", function(row, i){
		writeOutput("<h3>#row.region#</h3>");
		writeOutput("{district}");
	});
	group("district", function(row, i){
		writeOutput("<h4>#row.district#</h4>");
		writeOutput("{person}");
		writeOutput("<br>");
	});
	group("person", function(row, i){
		writeOutput("#row.person#;");
	});
});
</cfscript>
