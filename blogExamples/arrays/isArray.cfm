<cfscript>
a1 = arrayNew(1);
a2 = arrayNew(2);
a3 = arrayNew(3);
writeOutput("Is a1 a two-dimensional array: #isArray(a1, 2)#<br />");
writeOutput("Is a2 a two-dimensional array: #isArray(a2, 2)#<br />");
writeOutput("Is a3 a two-dimensional array: #isArray(a3, 2)#<br />");

writeOutput("Does a1 equal a2: #a1.equals(a2)#<br />");
writeOutput("Does a2 equal a3: #a2.equals(a3)#<br />");
writeOutput("Does a3 equal a1: #a3.equals(a1)#<br />");
</cfscript>