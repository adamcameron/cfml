<cfscript>
// matches.cfm
param name="URL.input" default="";
pattern = "^\d*$";
match = URL.input.matches(pattern);
writeDump(var=[{input=URL.input},{match=match}]);
</cfscript>