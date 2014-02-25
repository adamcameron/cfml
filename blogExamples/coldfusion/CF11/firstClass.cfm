<cfscript>
//firstClass.cfm
stringModifier = function(s, f){
	return f(s);
};

s = "G'day World";
writeDump([
	stringModifier(s, ucase),
	stringModifier(s, reverse),
	stringModifier(s, len)
]);
</cfscript>