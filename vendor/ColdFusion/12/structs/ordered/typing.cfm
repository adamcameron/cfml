<cfscript>
ordered = [=];

try {
	param StructOrdered ordered;
}
catch (any e){
	writeDump([
		type=e.type,
		message=e.message
	]);
}

StructOrdered function f(StructOrdered st){
	return st;
}

try {
	result = f(ordered);
}
catch (any e){
	writeDump([
		type=e.type,
		message=e.message
	]);
}
</cfscript>