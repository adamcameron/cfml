<cfscript>
numbers = ["tahi", "rua", "toru", "wha"];

for (i=1; i <= arrayLen(numbers); i++){
	number = numbers[i];
	writeOutput(number & "<br />");
}
writeDump(numbers);
</cfscript>