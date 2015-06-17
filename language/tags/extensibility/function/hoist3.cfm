<cfscript>
	function f(){
		arrayAppend(request.spy, varF);
		var varF	= {var="var_#i()#"};
		arrayAppend(request.spy, varF);
		varF.unscoped="unscoped_#i()#";
		arrayAppend(request.spy, varF);
		local.varF.local="local_#i()#";
		arrayAppend(request.spy, varF);
		return {arguments=arguments, local=local, varF=varF};
	}
	function g(){
		arrayAppend(request.spy, varG);
		varG.unscoped="unscoped_#i()#";
		arrayAppend(request.spy, varG);
		var varG	= {var="var_#i()#"};
		arrayAppend(request.spy, varG);
		local.varG.local="local_#i()#";
		arrayAppend(request.spy, varG);
		return {arguments=arguments, local=local, varG=varG};
	}

	request.spy = [];
	result = f(varF={arg="arg_#i()#"});
	writeDump(var=result, label="f()");
	writeDump(var=request.spy, label="request.spy");
	writeOutput("<hr>");

	request.spy = [];
	result = g(varG={arg="arg_#i()#"});
	writeDump(var=result, label="g()");
	writeDump(var=request.spy, label="request.spy");
	writeOutput("<hr>");

	function i(){
		param name="request.count" default=0;
		return ++request.count;
	}
</cfscript>