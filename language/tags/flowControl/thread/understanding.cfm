<cfscript>
	results = [];
	
	arrayAppend(results, {t=0});
	
	for (i=1; i <= 5; i++){
		thread name="t#i#" action="run" threadId="#i#" {
			
			value = f(t=attributes.threadId);
			arrayAppend(results, thread);
		}
	}
	
	thread action="join";
	
	writeDump(results);
	
	function f(t){
		return {
			t=t
		};
	}
</cfscript>