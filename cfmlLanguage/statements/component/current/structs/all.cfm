<cfscript>
//all.cfm

group1 = {
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
};

group2 = {
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
};

group3 = {
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
};

group4 = {
	property1 = "property1value",
	property2 = "property2value",
	property3 = "property3value",
	property4 = "property4value"
};

application.service.entryPoint(
	group1=group1,
	group2=group2,
	group3=group3,
	group4=group4
);
</cfscript>