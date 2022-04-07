<cfprocessingdirective suppresswhitespace="true">
<cfsetting enablecfoutputonly="true">

<cfif not thistag.hasEndTag>
	<cfoutput>&lt;cf_child> requires a closing tag.</cfoutput>
	<cfexit>
</cfif>

<cfif not listFindNoCase(getBaseTagList(), "cf_parent")>
	<cfoutput>&lt;cf_child> requires to be called within &lt;cf_parent>.</cfoutput>
	<cfexit>
</cfif>

<cfif thistag.executionMode eq "start">
	<!--- in the START section, validate any incoming variables, but don't do much else --->
	<cfsilent>
		<cfparam name="attributes.name" type="string">
		<cfparam name="attributes.birthdate" type="date">

		<cfset attributes.age = dateDiff("yyyy", attributes.birthDate, now())><!--- putting this in attributes to make it easier to associate to the parent tag, below  --->

		<!--- get the parent's data so as to calculate the age difference between parent and this child --->
		<cfset stParent = getBaseTagData("cf_parent")>
		<cfif structKeyExists(stParent.attributes, "birthdate")>
			<cfset attributes.ageDiff = dateDiff("yyyy", stParent.attributes.birthdate, attributes.birthDate)>
		<cfelse>
			<cfset attributes.ageDiff = "Unknown">
		</cfif>
		<!---  this puts this tag's ATTRIBUTES into the parent's thistag.chidlData[n] array, where n is the instance of the tag (there could be more than one instance of this tag within the same parent --->
		<cfassociate basetag="cf_parent" datacollection="childData">
	</cfsilent>
<cfelse><!--- it's the END tag --->
	<!--- Do all the processing here, because we have now captured whatever output/processing requirements there were between the opening and closing tags --->

	<!--- restricting output here because custom tags output all their whitespace unless it's controlled --->
	<cfoutput><table border="1"></cfoutput>
	<cfoutput><tr><td>Name</td><td>#attributes.name#</td></tr></cfoutput>
	<cfoutput><tr><td>Age</td><td>#attributes.age#</td></tr></cfoutput>

	<!--- as each child has been pushing its attributes back to the parent, the parent's data (from getBaseTagData(), above) will have all the preceding siblings info in it too.  Handy. --->
	<cfif structKeyExists(stParent.thisTag, "childData") and arrayLen(stParent.thisTag.childData) gt 1>
		<cfoutput><tr></cfoutput>
		<cfoutput><td>Older siblings</td></cfoutput>
		<cfoutput><td></cfoutput>
		<cfloop index="i" from="1" to="#arrayLen(stParent.thisTag.childData)-1#"><!--- the last one is this own tag's data, which we don't want here, hence omitting it --->
			<cfoutput><cfif i gt 1><br /></cfif>#stParent.thistag.childData[i].name# (#dateDiff("yyyy", stParent.thisTag.childData[i].birthDate, attributes.birthDate)#yrs older)</cfoutput>
		</cfloop>
		<cfoutput></td></tr></cfoutput>
	</cfif>
	<cfoutput><tr><td>Comment</td><td>#thistag.generatedContent#</td></tr></cfoutput>
	<cfoutput><tr><td>Age diff</td><td>#attributes.ageDiff#</td></tr></cfoutput>
	<cfoutput></table><br /></cfoutput>
	<cfset thistag.generatedContent = ""><!--- need to clear whatever is there out, because we've replaced it with different output--->
</cfif>
</cfprocessingdirective>