<cfscript>
	o = new TsEvent();
	system.dump(var=o, label="Created");
	o.setMyName("Adam");
	system.dump(var=o, label="Set");
	entitySave(o);
	system.dump(var=o, label="Saved");
</cfscript>