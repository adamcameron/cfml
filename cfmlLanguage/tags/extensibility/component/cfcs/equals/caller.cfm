<cfscript>
	// test one: very same object
	o = createObject("component", "shared.cfcs.equals.Name").init("Adam", "Cameron");
	writeOutput("o.equalsObject(o): [#o.equalsObject(o)#]<br />");

	// test one: same object, two pointers
	o = createObject("component", "shared.cfcs.equals.Name").init("Adam", "Cameron");
	p = o;
	writeOutput("o.equalsObject(p): [#o.equalsObject(p)#]<br />");

	// test two: different objects which are equal
	o1 = createObject("component", "shared.cfcs.equals.Name").init("Adam", "Cameron");
	o2 = createObject("component", "shared.cfcs.equals.Name").init("Adam", "Cameron");
	
	writeOutput("o1.equalsObject(o2): [#o1.equalsObject(o2)#]<br />");
</cfscript>