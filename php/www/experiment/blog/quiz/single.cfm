<cfscript>
// single.cfm

series = [100,300,100,50,50,50,50,50,500,200,100]
threshold = 500;

result = series.map(function(v,i,a){
	return a.slice(i,a.len()-i).reduce(function(best,current){
		if (best.done) return best;
		var run = best.run.sum() + current;
		return run <= 500 ? {run=best.run.append(current),done=false} : {run=best.run, done=true};
	},{run=[],done=false});
}).reduce(function(best,current){
	var lengthComparison = sgn(best.run.len() - current.run.len());
	return lengthComparison == 1 ? best : (lengthComparison == -1 ? current : ((best.run.sum() > current.run.sum() ? best : current)))   
},{run=[]}).run.toList();


writeDump(result);
</cfscript>