<cfscript>
// single.cfm

series = [100,300,100,50,50,50,50,50,500,200,100];
threshold = 500;


mapper = function(v,i,a){
	var subArray = a.slice(i,a.len()-i);
	return subArray.reduce(reducer,{run=[],done=false}).sort(sorter);
};

reducer = function(best,current){
	writeDump(best.run.append(current)); // returns boolean
	return best.done ? best : best.run.sum() + current <= threshold ? {run=best.run.append(current), done=false} : {run=best.run, done=true};
};

sorter = function(e1,e2){
	return sgn(e2.run.len() - e1.run.len()) ? sgn(e2.run.len() - e1.run.len()) : sgn(e2.run.sum() - e1.run.sum());
};

mapped = series.map(mapper);

result = mapped[1].run.toList();
writeDump(result);


</cfscript>