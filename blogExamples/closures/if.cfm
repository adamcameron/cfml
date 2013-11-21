<cfscript>
function _if(required boolean expression, required function _true, function _false){
	if (expression){
		writeOutput("_true() ran<br>");
		return _true();
	} else if(structKeyExists(arguments, "_false")){
		writeOutput("_false() ran<br>");
		return _false();
	}
}

result = _if(
	randRange(0,1),
	function(){
		return "heads";
	},
	function(){
		return "tails";
	}
);
writeOutput("#result#<br><hr>");


function loop(function before, function condition, function afterEach, function body){
	if (structKeyExists(arguments, "before")){
		before();
	}
	if (!structKeyExists(arguments, "condition")){
		condition = function(){
			return true;
		};
	}
	while (condition()){
		var result = body();
		afterEach();
	}
	return result;
}

iterations = 100;

start = getTickCount();
result = loop(
	function(){
		sum = 0;
		i=1;
	},
	function(){
		return i <= iterations;
	},
	function(){
		i++;
	},
	function(){
		sum += i;
		return sum;
	}
);
end = getTickCount();

writeOutput("#result#<br>");
writeOutput("#end-start#ms<br><hr>");

start = getTickCount();
sum=0;
for (i=1; i <= iterations; i++){
	sum += i;
}
end = getTickCount();

writeOutput("#result#<br>");
writeOutput("#end-start#ms<br><hr>");

writeDump(var=variables);
</cfscript>


