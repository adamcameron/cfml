<cfscript>
	for (i=1; i <= 3;i++){
		writeOutput("Before closure, 'mainline' i is #i#<br />");
		(
		closure(){
			var i = 0;
			for (i=1; i <= 3; i++){
				writeOutput("Within closure, 'inner' i is #i#<br />");
			}
			
		}
		)();
		writeOutput("After closure, 'mainline' i is still #i#<br />");
	}
</cfscript>
