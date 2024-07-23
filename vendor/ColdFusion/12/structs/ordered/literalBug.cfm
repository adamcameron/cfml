<cfscript>
/* normal = {
	"first" = 1,
	"second" = 2,
	"third" = 3,
	"fourth" = 4,
	"fifth" = 5
};
writeDump(normal);

ordered = [
	"first" = 1,
	"second" = 2,
	"third" = 3,
	"fourth" = 4,
	"fifth" = 5
]; */

one = "first";
two = "second";

normal = {
	#one# = 1,
	#two# = 2
};
writeDump(normal);


ordered = [
	#one# = 1,
	#two# = 2
];
writeDump(ordered);


</cfscript>