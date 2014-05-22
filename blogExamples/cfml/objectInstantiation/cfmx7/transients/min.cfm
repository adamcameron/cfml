<cfscript>
//all.cfm

group1 = new Group1(
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
);

group2 = new Group2(
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
);

application.service.entryPoint(
	group1=group1,
	group2=group2
);
</cfscript>