<cfscript>
	import com.daccf.cfbugsubscriber.model.Bug;
	
	param name="URL.bugID" type="integer" default=0;
	
	bug = new Bug();
	
	result = bug.validate({bug=URL.bugId});
	
	writeDump(result);
</cfscript>