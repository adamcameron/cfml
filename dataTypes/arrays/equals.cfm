<cfscript>
	oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer");

	a1 = listToArray("a,b,c,d,e,f");
	a2 = listToArray("a,b,c,d,e,f");
	a3 = listToArray("a,b,c,d,e,f,g");

</cfscript>

<cfoutput>
	a1.equals(a2): [#a1.equals(a2)#]<br />
	a1.equals(a3): [#a1.equals(a3)#]<br />
</cfoutput>