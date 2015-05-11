<cfscript>
// cv.cfm
cv = createObject("java", "ClassViewer");
try {
	1/0;
}catch (any e){
	writeOutput("<pre>#cv.viewObject(e)#</pre>");	
}
</cfscript>