<cfscript>
// testViaMixin.cfm
o = new Sub();
writeOutput(o.callPrivateMethodViaMixin());
</cfscript>