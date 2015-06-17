<cfxml variable="x">
	<base>
	<authentification>
		<master>foo</master>
	</authentification>
	</base>
</cfxml>

<cfset n =  x.XmlRoot.authentification..master["XmlText"]>
<cfdump var="#n#">