<cfscript>
x = 17.76;
y  = 100;
z = x*y;

/*
writeOutput(z & "<br>");

writeOutput(isValid("integer", z) & "<br>");

writeOutput(z.getClass().getName() & "<br>");
writeOutput(z.toString() & "<br>");
*/
v = val(z);
writeOutput(v & "<br>");
writeOutput(v.getClass().getName() & "<br>");
writeOutput(v.toString() & "<br>");
writeOutput(isValid("integer", v) & "<br>");
</cfscript>
