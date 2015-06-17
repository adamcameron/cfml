<cfxml variable="xmlData">
	<toes>
		<toe id="1" isticklish="yes" />
		<toe id="3" isticklish="no" />
		<toe id="2" isticklish="yes" />
		<toe id="4" isticklish="no" />
		<toe id="5" isticklish="yes" />
	</toes>
</cfxml>

<cfset xmlTemp = xmlData.toes.toe[3]>

<cfset xmlData.toes.toe[3] = duplicate(xmlData.toes.toe[2])>

<cfset xmlData.toes.toe[2] = xmlTemp>

<cfdump var="#xmlData#">