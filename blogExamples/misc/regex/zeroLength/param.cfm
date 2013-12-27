<cfscript>
// param.cfm
writeDump(var=URL, label="Before validation");
param name="URL.input" type="regex" pattern="^\d*$";
</cfscript>