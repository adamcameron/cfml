<cfscript>
	st1 = structNew();
	st1.firstName	= "Adam";
	st1.lastName	= "Cameron";

	st2 = st1;
	st2.firstName	= "Someone";
	st2.lastName	= "Else";

	st3 = duplicate(st1);
	st3.firstName	= "Third";
	st3.lastName	= "Person";
</cfscript>

<cfdump var="#variables#">