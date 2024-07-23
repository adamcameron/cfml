<cfscript>
	st1 = structNew();
	st1.a = javaCast("String", "1");
	st1.b = javaCast("String", "2");
	st1.c = javaCast("String", "3");

	st2 = structNew();
	st2.a = javaCast("int", "1");
	st2.b = javaCast("int", "2");
	st2.c = javaCast("int", "3");

	st3 = structNew();
	st3.a = javaCast("String", "1");
	st3.b = javaCast("String", "2");
	st3.c = javaCast("String", "3");

</cfscript>

<cfoutput>
	st1.equals(st2): [#st1.equals(st2)#]<br />
	st1.equals(st3): [#st1.equals(st3)#]<br />
</cfoutput>