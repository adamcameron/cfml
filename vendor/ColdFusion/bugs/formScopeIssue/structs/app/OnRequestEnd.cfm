<cflog file="#application.applicationname#" text="OnRequestEnd.cfm ran">
<cfoutput>Top of #getFileFromPath(getCurrentTemplatePath())#<br /></cfoutput>
<cfscript>
	// copy anything that's been put into request.session back into the session scope
	lock type="exclusive" scope="session" timeout=5 throwontimeout=true {
		writeOutput("request.session => session<br />");
		for (key in request.session){
			writeOutput("#key#<br />");
			session[key] = request.session[key];
		}
		writeDump(var=request.session, label="request.session");
		writeDump(var=session, label="session");
	}
</cfscript>
<cfoutput>Bottom of #getFileFromPath(getCurrentTemplatePath())#<br /></cfoutput>
<cflog file="#application.applicationname#" text="#serializeJson(session)#">