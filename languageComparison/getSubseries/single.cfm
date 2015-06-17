<cfscript>
// single.cfm

param URL.series = "";
param URL.threshold = 0;

series = URL.series.listToArray();
threshold = URL.threshold;



function getSubseries(series, threshold){
	return series.map(function(v,i,a){
		return a.slice(i,(a.len()-i)+1).reduce(function(best,current){
			return best
				.update("running", best.running && best.run.sum() + current <= threshold)
				.update("run", best.running ? best.run.append(current) : best.run);
		},{run=[], running=true});
	}).sort(function(e1,e2){
		return sgn(e2.run.len() - e1.run.len()) ? sgn(e2.run.len() - e1.run.len()) : sgn(e2.run.sum() - e1.run.sum());
	})[1].run ?: [];
}

result = getSubseries(series, threshold);


writeDump(result);
</cfscript>
