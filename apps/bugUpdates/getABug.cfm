<cfscript>
	bugbaseProxy = new components.BugbaseProxy();

	bug = bugbaseProxy.getBug(URL.id);

	writeDump(bug); 
</cfscript>