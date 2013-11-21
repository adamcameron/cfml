<cfscript>
function conditional(required boolean expression, required function pass, function fail){
	if (expression){
		writeOutput("pass() ran<br>");
		return pass();
	} else if(structKeyExists(arguments, "fail")){
		writeOutput("fail() ran<br>");
		return fail();
	}
}

result = conditional(
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

result = loop(
	function(){
		writeOutput("before() ran<br>");
		i=1;
	},
	function(){
		writeOutput("condition() ran<br>");
		return i <= 5;
	},
	function(){
		writeOutput("afterEach() ran<br>");
		i++;
	},
	function(){
		writeOutput("body() ran<br>");
		param numeric sum=0;
		writeOutput("#i#<br>");
		sum += i;
		return sum;
	}
);

writeOutput("#result#<br><hr>");
writeDump(var=variables);
</cfscript>


