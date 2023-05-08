<cfscript>
param URL.iterations=1;


timeIt("Populate standard struct", function(){
	standardStruct = structNew();
	for (var i=1; i <= URL.iterations; i++){
		standardStruct[i] = i;
	}
	writeOutput("Added #standardStruct.count()# keys to standardStruct<br>");
});

timeIt("Populate sorted struct", function(){
	sortedStruct = structNew("sorted", function(e1, e2){
		return sgn(e1 - e2);
	});
	for (var i=1; i <= URL.iterations; i++){
		sortedStruct[i] = i;
	}
	writeOutput("Added #sortedStruct.count()# keys to sortedStruct<br>");
});

timeIt("Get keys from standard struct", function(){
	var keys = standardStruct.keyArray();
	writeOutput("#keys.len()# keys extracted from standardStruct<br>");
});

timeIt("Get keys from sorted struct", function(){
	var keys = sortedStruct.keyArray();
	writeOutput("#keys.len()# keys extracted from sortedStruct<br>");
});


function timeIt(label, task){
	writeOutput("<h3>#label#</h3>");
	var startTime = getTickCount();
	task();
	var endTime = getTickCount();
	var executionTime = endTime - startTime;
	writeOutput("Execution time: #executionTime#ms<hr>");
};


</cfscript>