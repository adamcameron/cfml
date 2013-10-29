<cfscript>
	param boolean URL.caseSensitive;

	functionBeingTested = URL.caseSensitive ? "arrayFind()" : "arrayFindNoCase()";

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
			return arrayFind(array, value);
		}else{
			return arrayFindNoCase(array, value);
		}
	}
</cfscript>