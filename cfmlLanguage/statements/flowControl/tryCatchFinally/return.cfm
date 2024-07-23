<cfscript>
	function f(){
		try {
			return "try";
		}
		catch (any e){
			return "catch";
		}
		finally {
			return "finally";	
		}
		return "bottom";
	}
	
	writeOutput(f());
</cfscript>
