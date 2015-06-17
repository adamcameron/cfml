<cfscript>
//allWithDuplicate.cfm

group1 = duplicate(application.baseGroup1).init(
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
);

group2 = duplicate(application.baseGroup2).init(
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
);

group3 = duplicate(application.baseGroup3).init(
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
);

group4 = duplicate(application.baseGroup4).init(
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
);


application.service.entryPoint(
	group1=group1,
	group2=group2,
	group3=group3,
	group4=group4
);
</cfscript>