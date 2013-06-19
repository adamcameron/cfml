<cfscript>
	import com.daccf.cfbugsubscriber.model.*;

	param name="URL.bugID"		type="integer" default=0;
	param name="URL.accountId"	type="integer" default=0;
	
	bug = new Bug();
	
	before = entityLoad("Bug", URL.bugId, true);
	writeDump(var=before, label="before");
	
	bug.associateAccount(bugID=URL.bugId, accountId=URL.accountId);

	after = entityLoad("Bug", URL.bugId, true);
	writeDump(var=after, label="after");
	
</cfscript>