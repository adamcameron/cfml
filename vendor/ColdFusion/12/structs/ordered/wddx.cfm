<cfscript>
normal = {
	first = 1,
	second = 2,
	third = 3,
	fourth = 4,
	fifth = 5
};

cfwddx(action="cfml2wddx", input=normal, output="wddx");
cfwddx(action="wddx2cfml", input=wddx, output="struct");
writeDump([wddx,struct]);


ordered = [
	first = 1,
	second = 2,
	third = 3,
	fourth = 4,
	fifth = 5
];
cfwddx(action="cfml2wddx", input=ordered, output="wddx");
cfwddx(action="wddx2cfml", input=wddx, output="struct");
writeDump([wddx,struct]);

</cfscript>