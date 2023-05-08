<cfscript>
numbers = {
    five    = "rima",
    four    = "wha",
    three    = "toru",
    two        = "rua",
    one        = "tahi",
    six        = "ono"
};

writeOutput("Struct keys/values not sorted by default:<br />");
writeDump(structKeyArray(numbers));
writeOutput("<hr />");
writeOutput("structSort() returns an array of keys according to the ordering of the key values:<br />");
keys = structSort(numbers);
for (number in keys){
    writeOutput("#number#: <strong>#numbers[number]#</strong><br />");
}
writeOutput("(It's a bit odd to sort numbers alphabetically by their name, but it demonstrates the point!)");	
</cfscript>