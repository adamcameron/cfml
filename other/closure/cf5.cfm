<cfscript>
 
	function myCallback(){
		return "called back!";
	}
 
	function do_something_and_call_back( cb ){
		cb();
	}
 
</cfscript>
 
<cfoutput>#do_something_and_call_back( myCallback )#</cfoutput>