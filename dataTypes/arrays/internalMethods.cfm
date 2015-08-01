<cfscript>
	a1 = listToArray("Grant,Matt,Glenn,Adam,Indy,Rhys,Wazza");
	a2 = listToArray("Leigh,Miriama,Mat,Dave");
	q = queryNew("col");
	queryAddRow(q); querySetCell(q, "col", "Sharlene");
	queryAddRow(q); querySetCell(q, "col", "Melina");
	queryAddRow(q); querySetCell(q, "col", "Dong");
	queryAddRow(q); querySetCell(q, "col", "Leah");
	queryAddRow(q); querySetCell(q, "col", "Merryn");


</cfscript>

<cftry>
<cfset a1.addAll(a2)>
<cfset a1.addAll(q["col"])>
<cfdump var="#a1#">
<cfdump var="#a1.contains('glenn')#">
<cfcatch>NOPE<br /></cfcatch>
</cftry>

<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>
<pre>
<cfoutput>
#cv.viewObject(arrayNew(1))#
</cfoutput>
</pre>
