<cfscript>
//nullCoalescingOperatorCorrect.cfm
nullVariable = javaCast("null", "");
variableToSet = nullVariable ?: "default value";

writeDump({variableToSet=variableToSet});
</cfscript>