<cfscript>
// arrayReduce.cfm
rainbow = ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];

ul = arrayReduce(
	rainbow,
	function(previousValue, value){
		return previousValue & "<li>#value#</li>";
	},
	"<ul>"
) & "</ul>";
writeOutput(ul);

ol = rainbow.reduce(
	function(previousValue, value){
		return previousValue & "<li>#value#</li>";
	},
	"<ol>"
) & "</ol>";
writeOutput(ol);
</cfscript>