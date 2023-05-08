<cfscript>
// isValid.cfm
param name="URL.input" default="";
pattern = "^\d*$";
match = isValid("regex", URL.input, pattern);
writeDump(var=[{input=URL.input},{match=match}]);
</cfscript>