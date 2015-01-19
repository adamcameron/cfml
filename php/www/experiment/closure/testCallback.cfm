<cfscript>
o = new TestCallback(function(type){
	writeOutput("called via #type#<br>");
});


o.callDirect();
</cfscript>