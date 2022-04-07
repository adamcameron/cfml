<cfscript>
q1 = queryNew("digit,maori", "Integer,Varchar", [
	[1, "tahi"],
	[2, "TWO"],
	[3, "Toru"],
	[4, "Wha"]
]);
q2 = q1;

q1.maori[2] = "Rua";

writeDump(variables);
</cfscript>