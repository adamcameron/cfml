<cfscript>
	variables.when = "initial value in the calling-code's scope";
	
	f = function(){
		var bind = variables.when;
		writeOutput("#bind#<br />");
	};
	function g(){
		var bind = variables.when;
		writeOutput("#bind#<br />");
	}
</cfscript>
<cf_tag f="#f#" g="#g#" message="First Call">

<cfset variables.when = "updated value in the calling-code's scope">
<cf_tag f="#f#" g="#g#" message="First Call">