<cfscript>
// getSubseries.cfm

series = [100,300,100,50,50,50,50,50,500,200,100]
threshold = URL.threshold

subseries = getSubseries(series, threshold)
dump(subseries)

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