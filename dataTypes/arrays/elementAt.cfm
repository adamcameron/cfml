<cfscript>
	cv = createObject("java", "me.adamcameron.miscellany.ClassViewer");
	a = arrayNew(1);
	a[1] = "anteater";
	a[2] = "bear";
	a[4] = "doremouse";

	for (i=1; i le arrayLen(a); i=i+1){
		b = a.elementAt(javaCast("int", i-1));
		if (isDefined("b")){
			writeOutput("Element [#i#] [#a[i]#]<br />");
		}else{
			writeOutput("Element [#i#] [not set]<br />");
		}
	}
</cfscript>



<pre>
<cfoutput>
#cv.viewObject(a)#
</cfoutput>
</pre>
