<cfscript>
// blogStats.cfm
x = xmlParse("C:\temp\blog-01-01-2014.xml");
writeDump(var=x, top=10);

</cfscript>