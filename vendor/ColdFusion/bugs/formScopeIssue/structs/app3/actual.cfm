<cfscript>
	// fake onRequestStart(), and copy the session scope into it
	request.session = session;
	// and put the form scope into the session scope so it persists to the next request
	request.session.postData = form;
	// end fake onRequestStart()


	// requested code
	writeDump(var=form, label="form during request");
	writeDump(var=session, label="session during request");
	writeDump(var=request, label="request during request");
	writeOutput("<hr />");
	

	// fake onRequestEnd(), put request.session back into session
	session = request.session;
	// end fake onRequestEnd()	

	writeDump(var=session, label="session at end of request");
</cfscript>