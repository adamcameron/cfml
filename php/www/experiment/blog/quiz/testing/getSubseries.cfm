<cfscript>
// getSubseries.cfm
/*
function getSubseries(series, threshold){
	var working = []

	return series.reduce(function(reduction, current){
		working.append(current)
		if (working.sum() > threshold){
			working.deleteAt(1)
		}
		var workingIsBetterForLength	= working.len() > reduction.len()
		var workingIsBetterForTotal		= working.len() == reduction.len() && working.sum() > reduction.sum()
		return (workingIsBetterForLength || workingIsBetterForTotal) ? duplicate(working) : reduction
	}, [])
}
*/

function getSubseries(series, threshold){
	working = []
	return series.reduce(function(reduction, current){
		if (working.append(current).sum() <= threshold) {
			return working.len() > reduction.len() ? duplicate(working) : reduction
		}
		working.deleteAt(1)
		return reduction
	}, [])
}
</cfscript>