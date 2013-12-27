<cfscript>
// reMatch.cfm
param name="URL.input" default="";
pattern = "^\d*$";
match = reMatch(pattern, URL.input);
writeDump(var=[{input=URL.input},{match=match}]);	
</cfscript>