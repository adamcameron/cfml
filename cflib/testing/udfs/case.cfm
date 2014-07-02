<cfscript>
// case.cfm
	struct function case(){
		var resolved= arguments.resolved ?: false
		var result	= arguments.result ?: javacast("null", "")

		validateWhenArgs = function(condition, value){
			arguments.condition ?: throw(type="MissingArgumentException")
			isCustomFunction(arguments.condition) || isClosure(arguments.condition) ? true : throw(type="InvalidArgumentException")
			validateElseArgs(argumentCollection=arguments)
		}

		validateElseArgs = function(value){
			arguments.value	?: throw(type="MissingArgumentException")
			isCustomFunction(arguments.value) || isClosure(arguments.value) ? true : throw(type="InvalidArgumentException")
		}

		caseArgs = function(){
			return {resolved=resolved, result=result ?: javacast("null", "")}
		}

		return {
			when = function(condition, value){
				validateWhenArgs(argumentCollection=arguments)
				if (!resolved){
					resolved = condition() ?: false
					if (resolved){
						result = value()
					}
				}
				return case(argumentCollection=caseArgs())
			},
			else = function(value){
				validateElseArgs(argumentCollection=arguments)
				if (!resolved){
					resolved = true
					result = value()
				}
				var returnStruct = case(argumentCollection=caseArgs())
				returnStruct.delete("when")
				returnStruct.delete("else")
				return returnStruct

			},
			end = function(){
				return result
			}
		}
	}
</cfscript>