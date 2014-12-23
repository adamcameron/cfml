<cfif thisTag.executionMode EQ "START">
	<cfset attributes.dataForOuter = [{
		from	= "inner",
		to		= "outer",
		counter	= ++request.count
	}]>
	<cfset attributes.dataForMiddle = [{
		from	= "inner",
		to		= "middle",
		counter	= ++request.count
	}]>
	<cfassociate basetag="cf_outer" datacollection="dataFromInner">
	<cfassociate basetag="cf_middle" datacollection="dataFromInner">
</cfif>