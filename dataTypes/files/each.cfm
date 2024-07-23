<cfscript>
f = fileOpen(getCurrentTemplatePath());
f.each(function(){
	writeDump(arguments);
});
</cfscript>