<cfscript>
// returnsNullNumeric.cfm
include "../../../safeRun.cfm";

numeric function returnsAnInt(i) {
    return i;
}

safeRun("See what happens if we return null on an int function", function(){
    result = returnsAnInt(null);
    writeOutput("returnsAnInt(null): [#result#]<br>");
});
</cfscript>