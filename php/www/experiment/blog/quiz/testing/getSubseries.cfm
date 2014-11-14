<cfscript>
// getSubseries.cfm
function getSubseries(series, threshold){
	working = []
	return series.reduce(function(reduction, current){
		echo("<hr>processing: #serializeJson(reduction)# #serializeJson(current)#<br>");

		if (working.append(current).sum() <= threshold) {
			echo("working: #serializeJson(working)#<br>");
			// return working.len() > reduction.len() ? duplicate(working) : reduction

			echo("Under threshold: #working.len()# > #reduction.len()# | #working.sum()# > #reduction.sum()#<br>");
			return (working.len() > reduction.len() || working.len() == reduction.len() && working.sum() > reduction.sum()) ? duplicate(working) : reduction
		}
		working.deleteAt(1)
		echo("Over threshold: [#serializeJson(working)#]<br>");
		return reduction
	}, [])
}	
</cfscript>