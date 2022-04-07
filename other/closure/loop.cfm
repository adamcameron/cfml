<cfscript>
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
</cfscript>