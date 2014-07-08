<cfscript>
// case.cfm
struct function case(){
	var hasConditionBeenMet	= hasConditionBeenMet	?: false
	var hasResultBeenSet	= hasResultBeenSet		?: false

	var result = result ?: javacast("null", "")

	var validateCondition = function(condition){
		condition ?: throw(type="MissingArgumentException")
		isBoolean(condition) || isCustomFunction(condition) || isClosure(condition) ? true : throw(type="InvalidArgumentException")
	}

	var validateValue = function(value){
		value ?: throw(type="MissingArgumentException")
		isCustomFunction(value) || isClosure(value) ? true : throw(type="InvalidArgumentException")
	}

	var caseArgs = function(){
		return {
			hasConditionBeenMet	= hasConditionBeenMet,
			hasResultBeenSet	= hasResultBeenSet,
			result				= result ?: javacast("null", ""),
			functionsToReturn	= arguments[1]
		}
	}

	param functionsToReturn = ["when"];
	var functions = {}
	if (arrayFind(functionsToReturn, "when")){
		functions.when = function(condition){
			validateCondition(argumentCollection=arguments)
			if (!hasConditionBeenMet){
				if (isBoolean(condition)){
					hasConditionBeenMet = condition
				} else{
					hasConditionBeenMet = condition() ?: false
				}
			}
			return case(argumentCollection=caseArgs(["then"]))
		}
	}
	if (arrayFind(functionsToReturn, "then")){
		functions.then = function(value){
			validateValue(argumentCollection=arguments)
			if (hasConditionBeenMet && !hasResultBeenSet){
				result		= value()
				hasResultBeenSet	= true
			}
			return case(argumentCollection=caseArgs(["when","else","end"]))
		}
	}
	if (arrayFind(functionsToReturn, "else")){
		functions.else = function(value){
			validateValue(argumentCollection=arguments)
			if (!hasConditionBeenMet){
				result = value()
			}
			return case(argumentCollection=caseArgs(["end"]))
		}
	}
	if (arrayFind(functionsToReturn, "end")){
		functions.end = function(){
			return result ?: javacast("null", "")
		}
	}

	return functions
}
</cfscript>