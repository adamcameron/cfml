<cfif thisTag.executionMode EQ "START">
	<cfset attributes.dataForOuter = [{
		from	= "middle",
		to		= "outer",
		counter	= ++request.count
	}]>
	<cfassociate basetag="cf_outer" datacollection="dataFromMiddle">
<cfelse>
	<cfdump var="#thisTag.dataFromInner#" label="(middle) dataFromInner">
</cfif>
