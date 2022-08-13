<cfscript>
f = 132.48

writeDump([
    "f * 100" = f * 100,
    "precisionEvaluate(f * 100)" = precisionEvaluate(f * 100),
    "round(f * 100)" = round(f * 100)
]);
</cfscript>
