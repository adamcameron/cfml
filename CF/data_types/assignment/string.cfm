<cfscript>
s1 = "Tahi, TWO, toru, wha";
s2 = s1;

s1 = replace(s1, "TWO", "rua");

writeDump(variables);
</cfscript>