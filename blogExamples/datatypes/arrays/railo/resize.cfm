<cfscript>
a = [];
writeOutput("Initial size: #a.len()#<br />");
a.resize(1000);
writeOutput("After resize: #a.len()#<br />");
</cfscript>