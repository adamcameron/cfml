<cfxml variable="x">
	<aaa>
		<bbb attr="value">
			<ccc attr="Value" />
		</bbb>
		<ddd attr="VALUE">
			<eee attr="value" />
		</ddd>
	</aaa>
</cfxml>

<cfset a = xmlSearch(x, "//*[translate(lower-case(@attr), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')='value']")>
<cfdump var="#a#">