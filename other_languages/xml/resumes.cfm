<cfxml variable="x">
	<Resume>
		<StructuredXMLResume>
			<Name>Adam</Name>
			<Objective>World Peace</Objective>
		</StructuredXMLResume>
		<StructuredXMLResume>
			<Name>Barbara</Name>
		</StructuredXMLResume>
		<StructuredXMLResume>
			<Name>Chris</Name>
		</StructuredXMLResume>
		<StructuredXMLResume>
			<Name>Donna</Name>
			<Objective>Banana</Objective>
		</StructuredXMLResume>
		<StructuredXMLResume>
			<Name>Eric</Name>
			<Objective/>
		</StructuredXMLResume>
	</Resume>
</cfxml>
<cfdump var="#x#" expand="false">

<cfset a = xmlSearch(x, "Resume/StructuredXMLResume/Objective/parent::StructuredXMLResume")>
<cfdump var="#a#" expand="false">
<cfloop from="1" to="#arrayLen(a)#" index="i">
	<cfoutput>[#a[i].Name.xmlText#][#a[i].Objective.xmlText#]<br /></cfoutput>
</cfloop>