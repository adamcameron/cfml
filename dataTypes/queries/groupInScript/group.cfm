<cfscript>
function iterate(query, rowHandler){
	var groups = {};

	var group = function(column, groupHandler){
		var doGroup = (i == 1) || (previous[column] != row[column]);
		if (doGroup){
			groups[column] = groupHandler;
			groupHandler(row, i);
		}
	};

	var previous = {};
	for(var i=1; i <= query.recordCount; i++){
		var row = query.getRow(i);
		rowHandler(row, i, group);
		previous = row;
	}
}

personnel = new Personnel().get();

iterate(personnel, function(row, i, group){
	group("country", function(row, i){
		writeOutput("<h2>#row.country#</h2>");
		group("region", function(row, i){
			writeOutput("<h3>#row.region#</h3>");
			group("district", function(row, i){
				writeOutput("<h4>#row.district#</h4>");
				group("person", function(row, i){
					writeOutput("#row.person#;");
				});
				writeOutput("<br>");
			});
		});
	});
});
</cfscript>
<hr>
<cfoutput query="personnel" group="country">
	<h2>#country#</h2>
	<!--- <cfoutput group="region">
		<h3>#region#</h3>
		<cfoutput group="district">
			<h4>#district#</h4>
			<cfoutput>
				#person#;
			</cfoutput>
			<br>
		</cfoutput>
	</cfoutput> --->
</cfoutput>