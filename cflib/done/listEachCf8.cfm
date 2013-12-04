<cfscript>
function listEach(list, callback, delimiters){
	var arr		= false;
	var arrLen	= false;
	var result	= [];
	var index	= 0; 

	if (!structKeyExists(arguments, "delimiters")){
		delimiters = ",";
	}

	arr = listToArray(list, delimiters);
	arrLen = arrayLen(arr);

	for (index=1; index <= arrLen; index++){
		arrayAppend(result, callBack(argumentCollection=arguments, index=index, element=arr[index], length=arrLen));
	}
	return result;
}

	numbers = "tahi|rua|toru|wha";

	function _ucase(){
		return ucase(arguments.element);
	}
function toOLx(){
	if (arguments.index == 1){
		writeOutput("<ol>");
	}
	writeOutput('<li id="index_#arguments.index#">#arguments.element#</li>');
	if (arguments.index == arguments.length){
		writeOutput("</ol>");
	}
}

	upperCasedNumbers = listEach(numbers, _ucase, "|");
	writeOutput(serializeJson(upperCasedNumbers));
	writeOutput("<hr>");

	listEach(numbers, toOL, "|");
</cfscript>

<cffunction name="toOL">
	<cfif index EQ 1>
		<ul>
	</cfif>
	<cfoutput><li id="index_#index#">#element#</li></cfoutput>
	<cfif index EQ length>
		</ul>
	</cfif>
</cffunction>