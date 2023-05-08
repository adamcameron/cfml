<cfscript>
	st = structNew();
	st.colours = listToArray("red,green,blue");
	st.people = arrayNew(1);
	st.people[1] = structNew();
	st.people[1].firstName = "Adam";
	st.people[1].lastName = "Cameron";
	st.people[2] = structNew();
	st.people[2].firstName = "Jane";
	st.people[2].lastName = "Doe";

	s = st.toString();
</cfscript>
<cfdump var="#variables#">

