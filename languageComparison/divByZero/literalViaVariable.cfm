<cfscript>
// literalViaVariable.cfm

operator = url.operator ?: 'divide';
divisor = 0;
try {
	if (operator == 'divide'){
		result = 1 / divisor;
	}else{
		result = 1 % divisor;
	}
} catch (Any e){
	writeOutput("Operator: #operator#<br>");
	writeDump(e);
}	
</cfscript>