<cfscript>
cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");

immutableQuery = new ImmutableQueries().getTestQuery(false);
writeOutput("<pre>#cv.viewObject(immutableQuery)#</pre><hr>");

mutableQuery = new ImmutableQueries().getTestQuery(true);
writeOutput("<pre>#cv.viewObject(mutableQuery)#</pre><hr>");

</cfscript>