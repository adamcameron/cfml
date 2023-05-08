$(document).ready(
	function(){
		$.tablesorter.addParser(
			{ 
				id		: "bracketParser", 
				is		: function(s) { 
					return false; 
				}, 
				format	: function(s, table, cell, cellIndex) { 
					return $(cell).attr("data-bracket");
				}, 
				type	: "numeric" 
			}
		);

		$("#resultsTable").tablesorter(
			{
				headers: {
					1: {
						sorter: "bracketParser"
					}
				}
			}
		);
	}
	
);