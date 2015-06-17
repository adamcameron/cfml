<cfscript>
// getSubseries.cfm
/*
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
*/
function getSubseries(series, threshold){
	return series.map(function(v,i,a){
		return a.slice(i,(a.len()-i)+1).reduce(function(best,current){
			return best
				.update("running", best.running && best.run.sum() + current <= threshold)
				.update("run", best.running ? best.run.append(current) : best.run);
		},{run=[], running=true});
	}).sort(function(e1,e2){
		return sgn(e2.run.len() - e1.run.len()) ? sgn(e2.run.len() - e1.run.len()) : sgn(e2.run.sum() - e1.run.sum());
	})[1].run;
}

</cfscript>