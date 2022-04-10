<cfsavecontent variable="s">
<aaa>
	<bbb>
		<ccc ddd="eee" />
	</bbb>
</aaa>
</cfsavecontent>

<cfset x = xmlParse(s)>
<cfdump var="#x#">