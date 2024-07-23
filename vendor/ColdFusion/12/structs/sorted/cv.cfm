<cfscript>
sorted = structNew("sorted");
writeDump([sorted.getClass().getName()]);
cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
writeOutput("<pre>" & cv.viewObject(sorted) & "<hr>");
</cfscript>