<cfscript>
numbers = ["tahi", "rua", "toru", "wha", "rima", "ono", "whitu", "waru", "iwa", "tekau"];

CLI.writeLn("Using filter");
oddNumbers = numbers.filter(function(_,i){return i mod 2;});
writeDump(oddNumbers);
CLI.writeLn("=======================");

CLI.writeLn("Reducing filtered numbers");
oddNumbersAsString = oddNumbers.reduce(function(combined, oddNumber){
	return "#combined##oddNumber##chr(10)#";
}, "");
CLI.writeLn(oddNumbersAsString);
CLI.writeLn("=======================");


CLI.writeLn("Stepped for loop");
for (i=1; i <= numbers.len(); i+=2){
	CLI.writeLn(numbers[i]);
}
CLI.writeLn("=======================");
</cfscript>
<cfset CLI.writeLn("cfloop")>
<cfloop index="i" from="1" to="#numbers.len()#" step="2">
	<cfset CLI.writeLn(numbers[i])>
</cfloop>