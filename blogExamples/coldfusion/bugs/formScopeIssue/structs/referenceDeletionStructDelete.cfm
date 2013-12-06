<cfprocessingdirective pageencoding="utf-8">
<cfscript>
	// fake session
	sessionScope = {
		sessionid	= hash(createUuid())
	};
	sessionScope.urlToken = "CFID=#randRange(10000,99999)#&CFTOKEN=#randRange(1000000,9999999)#&jsessionid=#sessionScope.sessionid#";


	// fake incoming form
	formScope = {
		favouriteNumber = "wha tekau ma rua",
		favouriteColour	= "kakariki",
		favouritePlace	= "Taumata-whakatangihanga-koauau-o-tamatea-turi-pukakapiki-maunga-horo-nuku-pokai-whenua-kitanatahu"
	};

	// fake request scope, and copy the session scope into it
	requestScope = {
		session = sessionScope
	};

	writeOutput("<h2>Scopes after Application.cfm / onRequestStart()</h2>");
	writeDump(variables);


	// save the form scope in the session scope (as per OnRequestEnd.cfm / onRequestEnd())
	sessionScope.savedPostData = formScope;

	writeOutput("<h2>Scopes after OnRequestEnd.cfm / onRequestEnd()</h2>");
	writeDump(variables);


	// fake the form scope going out of scope
	structDelete(variables, "formScope");

	// and the request scope too
	structDelete(variables, "requestScope");

	writeOutput("<h2>Scopes after end of request (ie: where they'll be at the beginning of the next request)</h2>");
	writeDump(variables);
</cfscript>