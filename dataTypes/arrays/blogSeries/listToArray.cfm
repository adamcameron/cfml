<cfscript>
numbers = listToArray("tahi,rua,toru,wha,rima,ono,whitu,waru,iwa,tekau");
writeDump(numbers);

oddNumbers = listToArray("tahi,,toru,,rima,,whitu,,iwa,", ",", true);
writeDump(oddNumbers);

evenNumbers = [javaCast("null", ""), "rua", javaCast("null", ""), "wha", javaCast("null", ""), "ono", javaCast("null", ""), "waru",  javaCast("null", ""), "tekau"];
writeDump(evenNumbers);
</cfscript>