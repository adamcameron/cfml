<cfscript>
	function f(x=null){
		return isNull(x);
	}

	writeDump([f(),f(null), f("not null")]);
</cfscript>