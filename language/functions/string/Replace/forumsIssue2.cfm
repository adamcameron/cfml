<cfscript>
myvar = "This is a test product that will cost
$1,599.00 dollars with shipping at $4.99";
myvar = ReReplace(myvar, "(dollars)", "Euros");
writeOutput("<pre>#myVar#</pre><br /><hr />");

myvar = "This is a test product that will cost
$1,599.00 dollars with shipping at $4.99";
myvar = Replace(myvar, "$", "$$", "All");
myvar = ReReplace(myvar, "(dollars)", "Euros");
writeOutput("<pre>#myVar#</pre><br /><hr />");

</cfscript>