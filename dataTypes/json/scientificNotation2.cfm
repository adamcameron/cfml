<cfscript>
number = .0006;
preciseNumber = precisionEvaluate(.0006);
forcedNumber = number * 1;
forcedStringJava = number.toString();
forcedStringCfml = toString(number);

double = createObject("java", "java.lang.Double").init(0.0006);
float = createObject("java", "java.lang.Float").init(0.0006);

string = ".0006";

struct = {
	number			= number,
	preciseNumber	= preciseNumber,
	forcedNumber	= forcedNumber,
	forcedStringJava= forcedStringJava,
	forcedStringCfml= forcedStringCfml,
	double			= double,
	float			= float,
	string			= string
};
json = serializeJSON(struct);
writeDump([
	{"struct.number"=struct.number},
	{"struct.preciseNumber"=struct.preciseNumber},
	{"struct.forcedNumber"=struct.forcedNumber},
	{"struct.forcedStringJava"=struct.forcedStringJava},
	{"struct.forcedStringCfml"=struct.forcedStringCfml},
	{"struct.double"=struct.double},
	{"struct.float"=struct.float},
	{"struct.string"=struct.string},
	{struct=struct},
	{json=json}
]);
</cfscript>