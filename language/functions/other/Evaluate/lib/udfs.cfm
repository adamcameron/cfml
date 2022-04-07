<cfscript>
	function makeQuery(column, data){
		var q = queryNew("");
		queryAddColumn(q, "id", "integer", ids(arrayLen(data)));
		queryAddColumn(q, column, "varchar", data);
		return q;
	}

	function ids(numeric rows, array array=[]){
		arrayPrepend(array, rows);
		return rows==1 ? array : ids(rows-1, array);
	}

	function timeIt(label){
		var msg = "";
		param name="request.timeIt" default={};
		if (!structKeyExists(request.timeIt, label)){
			request.timeIt[label] = getTickCount();
		}else{
			msg = "Elapsed: #getTickCount()-request.timeIt[label]#ms";
			writeOutput("#msg#<br>");
		}
	}

	function timeIterations(required numeric iterations, required any callback, string label=getMetadata(callback).name){
		timeIt(label);
		for (var i=1; i <= iterations; i++){
			callback();
		}
		timeIt(label);
	}
</cfscript>