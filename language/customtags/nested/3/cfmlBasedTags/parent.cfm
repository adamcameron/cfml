<!--- parent.cfm --->
<cfif thistag.executionMode eq "end">
	<cfassociate basetag="cf_grandparent" datacollection="parentAttributesForGrandparent">
	<cfdump var="#thisTag.childAttributesForParent#" label="Parent childAttributesForParent">
</cfif>