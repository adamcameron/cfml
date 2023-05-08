<cfscript>
ordered = structNew("ordered");
writeDump([ordered.getClass().getName()]);
cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
writeOutput("<pre>" & cv.viewObject(ordered) & "<hr>");
</cfscript>