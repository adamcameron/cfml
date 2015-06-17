<cfscript>
	st1.name = "Adam";
	st2.name = "Rhys";
	st3.name = "Indy";

	st1.next = st2;
	st1.previous = st3;

	st2.next = st3;
	st2.previous = st1;

	st3.next = st1;
	st3.previous = st2;

	stLinkedList = structNew();
	stLinkedList.entry = st1;

</cfscript>
<cfdump var="#stLinkedList#" label="stLinkedList" top="3">