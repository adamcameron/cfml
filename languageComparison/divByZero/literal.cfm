<cfscript>
// literal.cfm

operator = url.operator ?: 'divide';
try {
	if (operator == 'divide'){
		result = 1 / 0;
	}else{
		result = 1 % 0;
	}
} catch (Any e){
	writeOutput("Operator: #operator#<br>");
	writeDump(e);
}	
</cfscript>