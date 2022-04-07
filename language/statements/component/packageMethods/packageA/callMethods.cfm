<cfscript>
// callMethods.cfm

safelyCallMethod(packageAObject, "packageAPublicMethod");
safelyCallMethod(packageAObject, "packageAPackageMethod");
safelyCallMethod(packageBObject, "packageBPublicMethod");
safelyCallMethod(packageBObject, "packageBPackageMethod");


function safelyCallMethod(required obj, required string method){
	try {
		invoke(obj, method);
	}catch (any e){
		writeOutput("#e.type# #e.message# #e.detail#<br>");
	}
	writeOutput("<hr>");
}
</cfscript>