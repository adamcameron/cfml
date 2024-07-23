<cfscript>
	oCv = createObject("java", "me.adamcameron.miscellany.ClassViewer");

	function structBuild(){
		return arguments;
	}

	st1 = structBuild(a=1, b=2, c=3);
	st2 = structBuild(a=1, b=2, c=3);
	st3 = structBuild(d=4, e=5, f=6);

</cfscript>

<cfoutput>
	st1.equals(st2): [#st1.equals(st2)#]<br />
	st1.equals(st3): [#st1.equals(st3)#]<br />
</cfoutput>