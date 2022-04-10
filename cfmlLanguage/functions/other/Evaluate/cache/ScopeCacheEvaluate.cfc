// ScopeCacheEvaluate.cfc
component {

	function init(scope){
		variables.scope = arguments.scope;
		"#variables.scope#.scopeCache" = {};

		return this;
	}

	function put(key, value){
		"#variables.scope#.scopeCache.#key#" = value;
	}

	function get(key){
		return evaluate("#variables.scope#.scopeCache.#key#");
	}

}