<cfscript>
result = this.that.theOther ?: "default";
writeOutput(result);

result = this.that[1].theOther ?: "default";
writeOutput(result);

function f(){
	var result = [];
	return result;
}

result = f()[1] ?: "default";
writeOutput(result);

</cfscript>