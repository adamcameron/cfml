<cfcomponent>
<cfscript>
	function init(scope){
		variables.scopeReferences = structNew();
		variables.scopeReferences.request = request;
		variables.scopeReferences.session	= session;
		variables.scopeReferences.application = application;
		
		variables.scope = arguments.scope;

		variables.scopeReferences[variables.scope].scopeCache = structNew();
		
		return this;
	}
	
	function put(key, value){
		variables.scopeReferences[variables.scope].scopeCache[key] = value;
	}
	
	function get(key){
		return variables.scopeReferences[variables.scope].scopeCache[key];
	}
</cfscript>
</cfcomponent>