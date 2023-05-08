<cfscript>
	function f(){
		var e	= structNew();
		try {
			x = 1 / 0;	
			writeOutput("Will never see this");
		} catch (any e){
			writeOutput("Well that was never gonna work, was it?");
		}	
	}
	
	f();
</cfscript>