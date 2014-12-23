<cfif thisTag.executionMode EQ "END">
	<cfdump var="#thisTag.dataFromMiddle#" label="(outer) dataFromMiddle">
	<cfdump var="#thisTag.dataFromInner#" label="(outer) dataFromInner">
</cfif>