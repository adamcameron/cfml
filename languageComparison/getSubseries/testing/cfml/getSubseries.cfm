<cfscript>
// getSubseries.cfm

function getSubseries(series, threshold){
	return series.map(function(element, index, series){
		return series.slice(index,(series.len()-index)+1).reduce(function(best,current){
			return best
				.update("running", best.running && best.run.sum() + current <= threshold)
				.update("run", best.running ? best.run.append(current) : best.run);
		},{run=[], running=true});
	}).sort(function(e1,e2){
		return sgn(e2.run.len() - e1.run.len()) ? sgn(e2.run.len() - e1.run.len()) : sgn(e2.run.sum() - e1.run.sum());
	})[1].run;
}
</cfscript>