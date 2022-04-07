<cfapplication name="app16" sessionmanagement="true">
<cflog file="#application.applicationname#" text="Application.cfm ran">
<cflog file="#application.applicationname#" text="#serializeJson(session)#">

<cfoutput>Top of #getFileFromPath(getCurrentTemplatePath())#<br /></cfoutput>
<cfscript>
	param name="session.requestCount" default=0;
	session.requestCount++;

	// copy session vars into request scope so we can leave session scope alone
	lock type="exclusive" scope="session" timeout=5 throwontimeout=true {
		writeOutput("session => request.session<br />");
		request.session = duplicate(session);
		writeDump(var=session, label="session");
		writeDump(var=request.session, label="request.session");
	}

	// if we have any form fields put them into the postData struct for safe keeping between requests
	if (structKeyExists(form, "fieldNames")){
		writeOutput("form => request.session.postData<br />");
		request.session.postData = duplicate(form);

		writeDump(var=form, label="form");
		writeDump(var=request.session.postData, label="request.session.postData");

	}else if (structKeyExists(request.session, "postData")){	// otherwise if we have a previously saved form, put it BACK in the form scope, and get rid of the copy
		writeOutput("request.session.postData => form<br />");
	    form = request.session.postData;
	    //structDelete(request.session, "postData");
		writeDump(var=form, label="form");
	}
</cfscript>
<cfoutput>Bottom of #getFileFromPath(getCurrentTemplatePath())#<br /></cfoutput>