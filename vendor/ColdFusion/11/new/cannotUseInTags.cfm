<!--- 
<cfset files = directoryList(expandPath(".."), true, "array", function(path,type,extn){
	return !listFindNoCase("cfm,cfc", extn) && type == "file";
}, "name")>

<cfset list = "a,b,c,d,e">
<cfset listEach(list, function(v,i){
	writeDump(arguments)

})>

 --->



<cfscript>
	
list = "a,b,c,d,e";
listEach(list, function(v,i){
	writeDump(arguments)

});
</cfscript>
