<cfscript>
// reFind.cfm
param name="URL.input" default="";
pattern = "^\d*$";
match = refind(pattern, URL.input);
writeDump(var=[{input=URL.input},{match=match}]);	
</cfscript>