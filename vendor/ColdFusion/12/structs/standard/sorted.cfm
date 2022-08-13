<cfscript>
// sorted.cfm

categoryTallies = {
	"gold" = 2,
	"premium" = 5309,
	"1st" = 37,
	"second" = 68113,
	"general" = 491
}; 

categoryTallies.each(function(category,tally){
	writeOutput("Category: #category#; tally: #tally#<br>");
});

writeOutput("<hr>");

sorted = categoryTallies.sort(function(category1, category2){
	return sgn(category1 - category2); 
}).each(function(category,tally){
	writeOutput("Category: #category#; tally: #categoryTallies[category]#<br>");
});
</cfscript>