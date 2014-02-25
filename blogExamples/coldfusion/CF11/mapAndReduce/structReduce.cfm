<style>
dt {
	float	: left;
	width	: 5em;
}
</style>
<cfscript>
// structReduce.cfm
rainbow = {
	"Red"="Whero",
	"Orange"="Karaka",
	"Yellow"="Kowhai",
	"Green"="Kakariki",
	"Blue"="Kikorangi",
	"Indigo"="Tawatawa",
	"Pink"="Mawhero"
};

dl = structReduce(
	rainbow,
	function(previousValue, key, value){
		return previousValue & "<dt>#key#</dt><dd>#value#</dd>";
	},
	"<dl>"
) & "</dl>";
writeOutput(dl);

dl = rainbow.reduce(
	function(previousValue, key, value){
		return previousValue & "<dt>#value#</dt><dd>#key#</dd>";
	},
	"<dl>"
) & "</dl>";
writeOutput(dl);
</cfscript>