<cfscript>
a = arrayNew(1);
a[2] = 2;

writeDump(a);
writeOutput("arrayMin: #arrayMin(a)#<br />");
writeOutput("arrayMax: #arrayMax(a)#<br />");
</cfscript>