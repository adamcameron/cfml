<cfscript>
sync = [];
unsync = arrayNew(1, false);

writeOutput("<pre>#createObject("java", "me.adamcameron.miscellany.ClassViewer").viewObject(sync)#</pre><hr>");
writeOutput("<pre>#createObject("java", "me.adamcameron.miscellany.ClassViewer").viewObject(unsync)#</pre><hr>");


</cfscript>