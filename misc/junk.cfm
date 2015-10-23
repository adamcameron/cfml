<cfscript>
a = [1,2,3];
a2 = a.filter(function(i){
	param local.ts = now();
	writeOutput("ts: #ts#<br>");
	sleep(1000);
	return true;

});	

</cfscript>