<cfscript>
//all.cfm

group1 = structNew();
group1.property1 = "property1value";
group1.property2 = "property2value";
group1.property3 = "property3value";
group1.property4 = "property4value";


group2 = structNew();
group2.property1 = "property1value";
group2.property2 = "property2value";
group2.property3 = "property3value";
group2.property4 = "property4value";


group3 = structNew();
group3.property1 = "property1value";
group3.property2 = "property2value";
group3.property3 = "property3value";
group3.property4 = "property4value";


group4 = structNew();
group4.property1 = "property1value";
group4.property2 = "property2value";
group4.property3 = "property3value";
group4.property4 = "property4value";


application.service.entryPoint(
	group1=group1,
	group2=group2,
	group3=group3,
	group4=group4
);
</cfscript>