<cfscript>
numbers = ["tahi", "rua", "toru", "wha"];

for (number in numbers){
	writeOutput(number & "<br />");
	if (number == "tahi"){
		arrayAppend(numbers, "rima");
	}
}
writeDump(numbers);
</cfscript>