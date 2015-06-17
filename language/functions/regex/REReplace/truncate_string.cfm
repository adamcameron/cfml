<cfscript>
	s="The quick brown fox jumps up and down on Foo until he is like anchovy paste";
	regex="^(.{20}).*";
	writeOutput(reReplace(s, regex, "\1..."));
</cfscript>

<cfscript>
	s="The quick brown fox jumps up and down on Foo until he is like anchovy paste";
	if (len(s) le 20){
		writeOutput(s);
	}else{
		writeOutput(left(s,20) & "...");
	}
</cfscript>
