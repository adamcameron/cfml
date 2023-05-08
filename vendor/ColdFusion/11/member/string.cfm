<cfscript>
// string.cfm
s =	"The";
s =	s.append("quick brown fox", " ")
	.append("jumps over the lazy dog", " ")
	.ucase()
	.reverse();
writeOutput(s);
</cfscript>