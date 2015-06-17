<cfscript>
	args = structNew();
	args.StartDate = "2006-09-01";
	args.EndDate = "2006-09-01";

	abc = CreateObject("component","BlocksAndClosures");
	x = abc.init(argumentcollection = args);
	z = abc.blocks();
</cfscript>