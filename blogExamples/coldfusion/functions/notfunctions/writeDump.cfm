<cfscript>
// writeDump.cfm
structKeyExists(URL, "debug") ? writeDump([URL,form,CGI]) : false;
</cfscript>