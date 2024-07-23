<cfscript>
i=1
do {
    x = randRange(1,10)
    if (x > 5) {
        continue;
    }
    writeOutput(x)
} while(++i <= 10)
</cfscript>
