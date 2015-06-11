<cfflush interval="16">
<cfscript>

	o = new TestUniqueKey();
	o.setNumericPart(randRange(0,9));
	o.setCharPart(chr(randRange(65,90)));
	entitySave(o);

</cfscript>
