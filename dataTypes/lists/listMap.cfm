<cfscript>
list = "|2|4|";
list.each(function(){
	writeDump(arguments);
}, "|", true);


newList = list.map(function(){
	writeDump(arguments);
}, "|", true);
</cfscript>