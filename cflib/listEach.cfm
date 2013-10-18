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

upperCasedNumbers = listEach(numbers, _ucase, "|");
writeOutput(serializeJson(upperCasedNumbers));

	writeOutput("<hr>");


function toOL(){
	if (index == 1){
		writeOutput("<ol>");
	}
	writeOutput('<li id="index_#index#">#element#</li>');
	if (index == length){
		writeOutput("</ol>");
	}
}


listEach(numbers, toOL, "|");

</cfscript>

<cffunction name="toOL">
	<cfif index EQ 1>
		<ol>
	</cfif>
	<cfoutput><li id="index_#index#">#element#</li></cfoutput>
	<cfif index EQ length>
		</ol>
	</cfif>
</cffunction>