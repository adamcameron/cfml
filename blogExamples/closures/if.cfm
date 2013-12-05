<cfscript>
function _if(required boolean condition, required function _true, function _false){
	if (condition){
		return _true();
	} else if(structKeyExists(arguments, "_false")){
		return _false();
	}
}
</cfscript>