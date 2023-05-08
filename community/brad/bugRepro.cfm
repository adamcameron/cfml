<cfscript>
lineMetricMap = fragentClass.getAgentInstrumentation().get("cflpi").getLineMetrics( theFile ) ?: {};

writeDump( lineMetricMap ); 

</cfscript>