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


application.service.entryPoint(
	group1=group1,
	group2=group2
);
</cfscript>