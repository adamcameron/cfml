// ScopeCacheReference.cfc
component {

	function init(scope){
		variables.scopeReferences = {
			request = request,
			session	= session,
			application = application
		};
		
		variables.scope = arguments.scope;

		variables.scopeReferences[variables.scope].scopeCache = {};
		
		return this;
	}
	
	function put(key, value){
		variables.scopeReferences[variables.scope].scopeCache[key] = value;
	}
	
	function get(key){
		return variables.scopeReferences[variables.scope].scopeCache[key];
	}


}