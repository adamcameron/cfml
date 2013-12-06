<cfscript>
	// fake incoming form
	formScope = {
		favouriteNumber = "wha tekau ma rua",
		favouriteColour	= "kakariki",
		favouritePlace	= "Taumata-whakatangihanga-koauau-o-tamatea-turi-pukakapiki-maunga-horo-nuku-pokai-whenua-kitanatahu"
	};


	// fake onSessionStart()
	sessionScope = {
		sessionid	= hash(createUuid())
	};
	sessionScope.urlToken = "CFID=#randRange(10000,99999)#&CFTOKEN=#randRange(1000000,9999999)#&jsessionid=#sessionScope.sessionid#";
	// end fake onSessionStart()


	// fake onRequestStart(), and copy the session scope into it
	requestScope = {
		session = sessionScope
	};
	// and put the form scope into the session scope so it persists to the next request
	requestScope.session.postData = formScope;
	// end fake onRequestStart()


	// requested code
	writeDump(var=formScope, label="formScope during request");
	writeDump(var=sessionScope, label="sessionScope during request");
	writeDump(var=requestScope, label="requestScope during request");
	writeOutput("<hr />");
	

	// fake onRequestEnd(), put requestScope.session back into session
	session = requestScope.session;
	// end fake onRequestEnd()	
	
	// request ended, tidy up
	structDelete(variables, "formScope");
	structDelete(variables, "requestScope");
	
	// check what's in the session scope
	writeDump(var=sessionScope, label="sessionScope after request");
</cfscript>