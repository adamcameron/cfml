<cfscript>
// case.cfm
	struct function case(){
		var conditionMet= arguments.conditionMet ?: false
		var resultSet	= arguments.resultSet ?: false
		var result		= arguments.result ?: javacast("null", "")

		var validateCondition = function(condition, value){
			arguments.condition ?: throw(type="MissingArgumentException")
			isCustomFunction(arguments.condition) || isClosure(arguments.condition) ? true : throw(type="InvalidArgumentException")
		}

		var validateValue = function(value){
			arguments.value	?: throw(type="MissingArgumentException")
			isCustomFunction(arguments.value) || isClosure(arguments.value) ? true : throw(type="InvalidArgumentException")
		}

		var caseArgs = function(){
			return {
				conditionMet		= conditionMet,
				resultSet			= resultSet,
				result				= result ?: javacast("null", ""),
				functionsToReturn	= arguments[1]
			}
		}
		var methods = {
			when = function(condition){
				validateCondition(argumentCollection=arguments)
				if (!conditionMet){
					conditionMet = condition() ?: false
				}
				return case(argumentCollection=caseArgs(["then"]))
			},
			then = function(value){
				validateValue(argumentCollection=arguments)
				if (conditionMet && !resultSet){
					result		= value()
					resultSet	= true
				}
				return case(argumentCollection=caseArgs(["when","else","end"]))
			},
			else = function(value){
				validateValue(argumentCollection=arguments)
				if (!conditionMet){
					result = value()
				}
				return case(argumentCollection=caseArgs(["end"]))
			},
			end = function(){
				return result
			}
		}

		param name="arguments.functionsToReturn" default=["when","then","else","end"];
		var ret = {}
		arguments.functionsToReturn.each(function(method){
			ret[method] = methods[method]
		})
		return ret
	}
</cfscript>