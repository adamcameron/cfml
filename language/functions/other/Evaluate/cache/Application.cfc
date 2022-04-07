component {

	this.name				= "scopeCache022";
	this.sessionManagement	= true;

	function onRequestStart(){
		if (!structKeyExists(application, "scopeCaches")){
			application.scopeCaches = {
				evaluate	= new ScopeCacheEvaluate("application"),
				reference	= new ScopeCacheReference("application")
			};
		}
	}
}