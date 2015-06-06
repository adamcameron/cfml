<cfxml variable="x">
	<root>
		<rote id="1">
			<rote id="2" colour="blue">
			</rote>
		</rote>
		<rote id="3">
			<rote id="4" colour="red">
			</rote>
		</rote>
	</root>
</cfxml>

<cfset a = xmlSearch(x, "//rote[@id='4' and @colour='red']")>

<cfdump var="#a#">