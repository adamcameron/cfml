<cfscript>
resultBaseline = ((10000000000000000 * 2) + 1) - (10000000000000000 * 2);
resultImprecise = evaluate("result = 10000000000000000 * 2", "result = result + 1", "result - (10000000000000000 * 2)");
resultPrecise = precisionEvaluate("result = 10000000000000000 * 2", "result = result + 1", "result - (10000000000000000 * 2)");
writeDump(variables);
</cfscript>