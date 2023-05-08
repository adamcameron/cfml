<cfscript>
a1 = listToArray("Tahi,TWO,Toru,Wha");
a2 = a1;

a1[2] = "Rua";

</cfscript>

<cfdump var="#variables#">
<cfdump var="#server#">
