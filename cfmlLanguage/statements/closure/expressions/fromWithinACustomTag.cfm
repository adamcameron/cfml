<cfscript>
	variables.when = "bound at declaration";
	
	f = function(){
		var bind = variables.when;
		writeOutput("#bind#<br />");
	};
	function g(){
		var bind = variables.when;
		writeOutput("#bind#<br />");
	}
</cfscript>
<cf_tag f="#f#" g="#g#">