<cfscript>
// 3845479.cfm
new CFIDE.adminapi.administrator().login("");

writeOutput(new CFIDE.adminapi.Security().isAdminUser());
</cfscript>