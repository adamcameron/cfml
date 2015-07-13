<cfscript>
function iterate(query, rowHandler){
	var groups = {};
	var group = function(column, groupHandler){
		groups[column] = groupHandler;
		groupHandler(row, i);
	};
	var previous = {};
	for(var i=1; i <= query.recordCount; i++){
		row = query.getRow(i);
		var rowDone = false;
		groups.each(function(column){
			if (!rowDone && (previous.isEmpty() || previous[column] == row[column])){
				groupHandler = groups[column];
				groupHandler(row, i);
				rowDone = true;
			}
		});
		if (!rowDone){
			rowHandler(row, i, group);
		}
		previous = row;
	}
}

week = queryNew("id,en,other,tally", "integer,varchar,varchar,varchar", [
	[1, "one", "tahi", "a"],
	[2, "two", "rua", "bb"],
	[3, "two", "rua", "cc"],
	[4, "two", "deux", "dd"],
	[5, "two", "deux", "ee"],
	[6, "three", "toru", "fff"],
	[7, "three", "toru", "ggg"],
	[8, "three", "toru", "hhh"],
	[9, "three", "trois", "iii"],
	[10, "three", "trois", "jjj"],
	[11, "three", "trois", "kkk"],
	[12, "three", "san", "lll"],
	[13, "three", "san", "mmm"],
	[14, "three", "san", "nnn"],
	[15, "four", "wha", "oooo"],
	[16, "four", "wha", "pppp"],
	[17, "four", "wha", "qqqq"],
	[18, "four", "wha", "rrrr"],
	[19, "four", "quatre", "ssss"],
	[20, "four", "quatre", "tttt"],
	[21, "four", "quatre", "uuuu"],
	[22, "four", "quatre", "vvvv"],
	[23, "four", "shi", "wwww"],
	[24, "four", "shi", "xxxx"],
	[25, "four", "shi", "yyyy"],
	[26, "four", "shi", "zzzzz"],
	[27, "four", "vier", "aaaa"],
	[28, "four", "vier", "bbbb"],
	[29, "four", "vier", "cccc"],
	[30, "four", "vier", "dddd"]
]);

iterate(week, function(row, i, group){
	writeOutput("<h2>#row.en#</h2>");
	group("en", function(row, i){
		writeOutput("<h3>#row.other#</h3>");
		group("other", function(row, i, group){
			writeOutput("#i#/#row.tally#<br>");
		});
	});
});
</cfscript>
<hr>
<cfoutput query="week" group="en">
	<h2>#en#</h2>
	<cfoutput group="other">
		<h3>#other#</h3>
		<cfoutput>
		#currentRow#/#tally#<br>
		</cfoutput>
	</cfoutput>
</cfoutput>