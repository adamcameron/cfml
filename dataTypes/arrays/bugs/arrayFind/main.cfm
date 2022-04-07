<cfscript>
	writeOutput("<h1>arrayFindNoCase()</h1>");
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
</cfscript>