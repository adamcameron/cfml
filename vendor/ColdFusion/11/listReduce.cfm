<cfprocessingdirective pageEncoding="utf-8">
<cfscript>
// listReduce.cfm

week = "Rāhina,Rātū,Rāapa,Rāpare,Rāmere,Rāhoroi,Rātapu";

result = week.reduce(
	function(result,item,index,list){
		return result.append(item, "|");
	},
	""
);
writeDump(variables);
</cfscript>