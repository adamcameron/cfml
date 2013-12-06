<cfscript>
letters = {
    e    = "echo",
    a    = "alpha",
    b    = "bravo",
    d    = "delta",
    c    = "charlie"
};
writeDump(var=letters, label="Under the hood, &lt;cfdump&gt; sorts them");
writeOutput("<hr />");

writeOutput("Struct keys not sorted by default:<br />");
for (letter in letters){
    writeOutput("#letter#: #letters[letter]#<br />");
}
writeOutput("<hr />");

writeOutput("structKeyArray() not sorted by default:<br />");
keys = structKeyArray(letters);
writeDump(keys);
writeOutput("<hr />");

writeOutput("Having sorted the array, we can access the struct keys in alphabetic order:<br />");
arraySort(keys, "textnocase");
writeDump(keys);	
</cfscript>