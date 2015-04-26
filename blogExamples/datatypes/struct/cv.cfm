<cfscript>
// cv.cfm	
try {
	1/0;
} catch (any e){
	writeOutput("<pre>#createObject("java", "ClassViewer").viewObject(e)#</pre>");
}
</cfscript>