<cfscript>
URL.size = URL.size ?: 1;

function getSize(size){
	return size;
}

timeJob = function(message, job) {
	var start = getTickCount();
	job();
	var end = getTickCount();
	var duration = end - start;
	writeOutput("#message#: #duration#ms<br>");
};

writeOutput("<h3>Running #size# iterations</h3>");

timeJob("Baseline (ascending)", function(){
	for (var i=1; i <= getSize(URL.size); i++){
		var b = i;
	}
});

timeJob("Using variable for length (ascending)", function(){
	var iterations = getSize(URL.size);
	for (var i=1; i <= iterations; i++){
		var b = i;
	}
});

timeJob("Post decrement (descending)", function(){
	for (var i=getSize(URL.size)+1; (i--)-1;){
		var b = i;
	}
});

timeJob("Pre decrement (descending)", function(){
	for (var i=getSize(URL.size)+1; (--i);){
		var b = i;
	}
});

timeJob("Pre decrement with additional operation (descending)", function(){
	for (var i=getSize(URL.size)+1; (--i);){
		var b = i;
		var c = i;
	}
});
</cfscript>