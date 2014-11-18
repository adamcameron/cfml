<cfscript>
// getSubseries.cfm

function getSubseries(series, threshold){
	var working = []

	return series.reduce(function(reduction, current){
		working.append(current)
		while (working.sum() > threshold){
			working.deleteAt(1)
		}
		var workingIsBetterForLength	= working.len() > reduction.len()
		var workingIsBetterForTotal		= working.len() == reduction.len() && working.sum() > reduction.sum()
		return (workingIsBetterForLength || workingIsBetterForTotal) ? duplicate(working) : reduction
	}, [])
}

</cfscript>