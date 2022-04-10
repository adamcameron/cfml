<cfscript>
	scopeCaches = {
		application = {
			evaluate	= new ScopeCacheEvaluate("application")
		},
		session = {
			reference	= new ScopeCacheReference("session")
		},
		request = {
			evaluate	= new ScopeCacheEvaluate("request"),
			reference	= new ScopeCacheReference("request")
		}
	};
	
	
	scopeCaches.application.evaluate.put(key="applicationEvaluateCache", value="This is in the application scope via the EvaluateCache");
	scopeCaches.session.reference.put(key="sessionReferenceCache", value="This is in the session scope via the ReferenceCache");
	scopeCaches.request.evaluate.put(key="requestEvaluateCache", value="This is in the request scope via the EvaluateCache");
	scopeCaches.request.reference.put(key="requstReferenceCache", value="This is in the request scope via the ReferenceCache");
	
	writeDump(var=application, label="application");
	writeDump(var=session, label="session");
	writeDump(var=request, label="request");
</cfscript>