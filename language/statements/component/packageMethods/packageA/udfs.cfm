<cfscript>
// udfs.cfm

function safelyCallMethod(required obj, required string method){
	try {
		invoke(obj, method);
	}catch (any e){
		rethrow;
		writeOutput("#e.type# #e.message# #e.detail#<br>");
	}
	writeOutput("<hr>");
}
</cfscript>