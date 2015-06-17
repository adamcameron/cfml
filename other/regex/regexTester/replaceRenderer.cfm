<!---
	included from Regex.cfc's processCfRegex() method
	assumes following variables exist:
	sNewString
--->
<cfsavecontent variable="sReturnHtml">
	<cfif len(sNewString)>
		<table cellspacing="0" class="results">
			<thead><tr><th>Updated String</th></tr></thead>
			<tbody><tr><td><cfoutput>#htmlEditFormat(sNewString)#</cfoutput></td></tr></tbody>
		</table>
	<cfelse>
		No string returned
	</cfif>
</cfsavecontent>
