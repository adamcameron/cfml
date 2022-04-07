<cfcomponent>
<cfscript>
	function init(scope){
		variables.scope = arguments.scope;
		"#variables.scope#.scopeCache" = structNew();
		
		return this;
	}
	
	function put(key, value){
		"#variables.scope#.scopeCache.#key#" = value;
	}
	
	function get(key){
		return evaluate("#variables.scope#.scopeCache.#key#");
	}
</cfscript>
</cfcomponent>