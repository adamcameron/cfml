<cfscript>
requestedIndex = URL.i;
numbers = ["tahi", "rua", "toru", "wha"];

elementIsNull = isNull(numbers[requestedIndex]);
writeOutput("The requested element is null: #elementIsNull#<br>");

requestedElement = numbers[requestedIndex];
writeOutput("The element requested is: #requestedElement#<br>");
</cfscript>
