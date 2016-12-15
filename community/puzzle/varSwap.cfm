<cfscript>
A = {one="tahi"};
B = ["rua", "toru"];
writeDump([A,B]);
writeOutput("<hr>");

B = {A=A, B=A=B}.A;
writeDump([A,B]);
writeOutput("<hr>");

A = {one="tahi"};
B = ["rua", "toru"];

B = [A,(A=[B])[1]][1];
writeDump([A,B]);
writeOutput("<hr>");

A = {one="tahi"};
B = ["rua", "toru"];

B = [A,A=B][1];
writeDump([A,B]);
writeOutput("<hr>");

</cfscript>