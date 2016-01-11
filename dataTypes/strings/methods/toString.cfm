<cfscript>
include "../../../safeRun.cfm";	

safeRun("testing headless function", function(){
	writeDump(left); 	
});	

safeRun("testing CFML method", function(){
	s = "";	
	ref = s.left;
	writeDump(ref); 	
});	

safeRun("testing Java method", function(){
	s = "";	
	ref = s.toString;
	writeDump(ref); 	
});	
</cfscript>