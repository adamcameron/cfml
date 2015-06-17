<cfflush interval="16">
<cfscript>

	o = new Test();
	o.setValue("foo");
	entitySave(o);

</cfscript>
