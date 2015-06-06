<cfscript>
include "/shared/git/misc/udfs/stringFind.cfm";

string = "This is a string that has words of differing lengths, and I'm gonna use stringFind() to return the words that are five or six characters long";
pattern = "\b(\w{5,6})\b";
result = stringFind(pattern, string, true, 1, false);
writeDump(result);
</cfscript>
