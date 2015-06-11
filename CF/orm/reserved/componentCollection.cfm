<cfflush interval="16">
<cfscript>
	oComps = new ComponentCollection();
	
	oComps.setId(1);

	oC1 = new Component();
	oC1.setId(1);
	oC1.setData("A");
	entitySave(oC1);
	oComps.addComponents(oC1);

	oC2 = new Component();
	oC2.setId(2);
	oC2.setData("B");
	entitySave(oC2);
	oComps.addComponents(oC2);
	writeDump(oComps);
	
	entitySave(oComps);
	
	ormFlush("scratch");
	
	a2 = entityload("ComponentCollection");
	writeDump(a2);
</cfscript>