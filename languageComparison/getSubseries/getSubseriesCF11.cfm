<cfscript>
// getSubseriesCF11.cfm

series = [100,300,100,50,50,50,50,50,500,200,100];
threshold = URL.threshold;

subseries = getSubseries(series, threshold);
writeDump(subseries);

function getSubseries(series, threshold){
	var working = [];
	return series.reduce(function(reduction, current){
		working.append(current);
		if (working.sum() <= threshold) {
			return working.len() > reduction.len() ? working : reduction;
		}
		working.deleteAt(1);
		return reduction;
	}, []);
}	
</cfscript>