<cfscript>
cookie.each(function(name){
	if (name.findNoCase("cf") == 1) return;
	cfcookie(name=name, value="", expires="now");
});	
</cfscript>