<cfscript>
withLocalAndRuntimeArg = function(){
	local.where = "local";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
};
withLocalAndRuntimeArg(where="arg");
writeOutput("<hr>");


withLocalAndDeclaredArg = function(where="default"){
	local.where = "local";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
};
withLocalAndDeclaredArg(where="arg");
writeOutput("<hr>");


withLocalAndDeclaredArgDefault = function(where="default"){
	local.where = "local";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
};
withLocalAndDeclaredArgDefault();
writeOutput("<hr>");


withVar = function(){
	var where = "var";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
};
withVar(where="arg");
writeOutput("<hr>");


withBothLocalSecond = function(){
	local.where = "local";
	var where = "var";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
};
withBothLocalSecond(where="arg");
writeOutput("<hr>");


withBothVarSecond = function(){
	var where = "var";
	local.where = "local";

	writeDump(var={
		arguments = arguments.where,
		local = local.where,
		unscoped = where
	}, label="#getFunctionCalledName()#()");

	return where;
};
withBothVarSecond(where="arg");
writeOutput("<hr>");
</cfscript>