<cfscript>
param URL.iterations=0;


function timeIt(task, message){
	writeOutput("<h3>#message#</h3>");
	var start = getTickCount();
	task();
	var end = getTickCount();
	writeOutput("Execution time: #end-start#ms<br><hr>");
}

function populateIt(struct, iterations){
	for (var i=1; i <= iterations; i++){
		struct[i] = randRange(1,URL.iterations);
	}
	return struct;
}

function getEm(struct){
	return struct.keyArray();
}

normal = {};
timeIt("Populate normal", function(){
	populateIt(normal, URL.iterations);
});
timeIt("getEm normal", function(){
	getEm(normal);
});

sorted = structNew("sorted", function(e1, e2){
});



</cfscript>