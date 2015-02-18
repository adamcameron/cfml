<!--- child.cfm --->
<cfif thistag.executionMode eq "end">
	<cfassociate basetag="cf_grandparent" datacollection="childAttributesForGrandparent">
	<cfassociate basetag="cf_parent" datacollection="childAttributesForParent">
</cfif>