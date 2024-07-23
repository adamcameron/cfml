<cfscript>
cv = createObject("shared.cf.data_types.cv.cf.ClassViewer");

original = structNew();
normal = structNew("normal");
linked = structNew("linked");
weak = structNew("weak");
literal = {};

writeOutput("<pre>#cv.viewObject(original)#</pre><hr>")
writeOutput("<pre>#cv.viewObject(linked)#</pre><hr>")

</cfscript>