<cfscript>
//all.cfm

group1 = createObject("component", "Group1").init(
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
);

group2 = createObject("component", "Group2").init(
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