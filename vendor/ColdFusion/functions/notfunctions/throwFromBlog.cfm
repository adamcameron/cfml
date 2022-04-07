<cfscript>
// throwFromBlog.cfm
/*
function f(){
	var validateCondition = function(condition){
		condition ?: throw(type="MissingArgumentException");
		isBoolean(condition) || isCustomFunction(condition) || isClosure(condition) ? true : throw(type="InvalidArgumentException");
	};
}
*/
function f(){
	var validateCondition = function(condition){
		if (isNull(condition))  throw(type="MissingArgumentException");
		if (!(isBoolean(condition) || isCustomFunction(condition) || isClosure(condition))) throw(type="InvalidArgumentException");
	};
}

throw(type="MissingArgumentException", message="The correct exception was thrown");
</cfscript>