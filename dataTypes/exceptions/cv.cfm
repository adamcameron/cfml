<cfscript>
// cv.cfm
cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
try {
	1/0;
}catch (any e){
	writeOutput("<pre>#cv.viewObject(e)#</pre>");	
}
</cfscript>