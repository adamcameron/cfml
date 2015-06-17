<cfscript>
number = .0006;
struct = {number=number};
json = serializeJSON(struct);
writeDump([
	{number=number},
	{"struct.number"=struct.number},
	{struct=struct},
	{json=json}
]);
</cfscript>