<cfscript>
// seanCase.cfm
struct function case(){
	var requireCondition = function(condition){
		condition ?: throw(type="MissingArgumentException")
		!isBoolean(condition) && !isCustomFunction(condition) && !isClosure(condition) &&
			throw(type="InvalidArgumentException")
	}
	var requireValue = function(value){
		value ?: throw(type="MissingArgumentException")
		!isCustomFunction(value) && !isClosure(value) &&
			throw(type="InvalidArgumentException")
	}
	return {
		when = function(condition){
			requireCondition(argumentCollection=arguments)
			if ( isBoolean( condition ) ? condition :
				 ( condition() ?: false ) ) {
				return {
					then = function(value){
						requireValue(argumentCollection=arguments)
						var ender = {
							end = function(){
								return value() ?: javaCast("null","")
							}
						}
						var whenner = { }
						var thenner = {
							when = function(_){ return whenner },
							else = function(_){ return ender },
							end = ender.end
						}
						whenner.then = function(_){ return thenner }
						return thenner
					}
				}
			} else {
				return {
					then = function(_){
						return {
							when = case().when,
							else = function(value){
								requireValue(argumentCollection=arguments)
								return {
									end = function(){
										return value() ?: javaCast("null","")
									}
								}
							},
							end = function(){ return javaCast("null","") }
						}
					}
				}
			}
		}
	}
}
</cfscript>