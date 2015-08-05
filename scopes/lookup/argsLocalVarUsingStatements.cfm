<cfscript>
// argsLocalVarUsingStatements.cfm

function withLocalAndRuntimeArg(){
	local.where = "local";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
}
withLocalAndRuntimeArg(where="arg");
writeOutput("<hr>");


function withLocalAndDeclaredArg(where="default"){
	local.where = "local";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
}
withLocalAndDeclaredArg(where="arg");
writeOutput("<hr>");


function withLocalAndDeclaredArgDefault(where="default"){
	local.where = "local";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
}
withLocalAndDeclaredArgDefault();
writeOutput("<hr>");


function withVar(){
	var where = "var";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
}
withVar(where="arg");
writeOutput("<hr>");


function withBothLocalSecond(){
	local.where = "local";
	var where = "var";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
}

withBothLocalSecond(where="arg");
writeOutput("<hr>");


function withBothVarSecond(){
	var where = "var";
	local.where = "local";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
}

withBothVarSecond(where="arg");
writeOutput("<hr>");
</cfscript>