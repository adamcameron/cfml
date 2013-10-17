<cfscript>
	public array function listEach(required string list, required function callback, string delimiters=","){
		var arr = listToArray(list, delimiters);
		var arrLen = arrayLen(arr);
		var result = [];
		for (var index=1; index <= arrLen; index++){
			arrayAppend(result, callBack(argumentCollection=arguments, index=index, element=arr[index], length=arrLen));
		}
		return result;
	}

	numbers = "tahi|rua|toru|wha";

	function _ucase(){
		return ucase(element);
	}
	function toOL(){
		if (index == 1){
			writeOutput("<ol>");
		}
		writeOutput('<li id="index_#index#">#element#</li>');
		if (index == length){
			writeOutput("</ol>");
		}
	}

	upperCasedNumbers = listEach(numbers, _ucase, "|");
	writeOutput(serializeJson(upperCasedNumbers));
	writeOutput("<hr>");

	listEach(numbers, toOL, "|");

</cfscript>