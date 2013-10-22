<cfscript>
	param boolean URL.caseSensitive;

	functionBeingTested = URL.caseSensitive ? "arrayFindNoCase()" : "arrayFind()";

	writeOutput("<h1>#functionBeingTested# testing</h1>");
	include "string.cfm";
	include "array.cfm";
	include "struct.cfm";
	include "object.cfm";
	include "xml.cfm";


	function assert(boolean condition, string failMessage){
		if (condition){
			writeOutput('<div style="color:green">Test passed</div>');
		}else{
			writeOutput('<div style="color:red">#failMessage#</div>');
		}
	}

	numeric function arrayFindFunction(required array array, required any value, required string caseSensitive){
		if (caseSensitive){
			return arrayFindNoCase(array, value);
		}else{
			return arrayFind(array, value);
		}
	}
</cfscript>