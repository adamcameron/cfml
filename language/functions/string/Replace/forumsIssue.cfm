<cfscript>
myvar = "This is a test product that will cost
$1,599.00 dollars with shipping at $4.99";
writeOutput("Original:<br /><pre>#myVar#</pre><br /></hr />");

myvar = Replace(myvar, "#chr(13)#$", "#chr(13)#$$", "All");
writeOutput("Swap CR$ with CR$$:<br /><pre>#myVar#</pre><br /></hr />");

myvar = Replace(myvar, "#chr(10)#$", "#chr(10)#$$", "All");
writeOutput("Swap LF$ with LF$$:<br /><pre>#myVar#</pre><br /></hr />");

myvar = ReReplace(myvar, "(dollars)", "Euros");
writeOutput("Swap (dollars) for Euros:<pre>#myVar#</pre><br /></hr />");
</cfscript>