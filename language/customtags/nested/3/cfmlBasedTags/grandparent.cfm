<!--- grandparent.cfm --->
<cfif thistag.executionMode eq "end">
	<cfdump var="#thisTag.childAttributesForGrandparent#" label="Grandparent childAttributesForGrandparent">
	<cfdump var="#thisTag.parentAttributesForGrandparent#" label="Grandparent parentAttributesForGrandparent">
</cfif>