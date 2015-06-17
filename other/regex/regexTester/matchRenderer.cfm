<!---
	included from Regex.cfc's processCfRegex() method
	assumes following variables exist:
	aRegexMatches
--->
<cfsavecontent variable="sReturnHtml">

<cfoutput>
<cfif arrayLen(aRegexMatches)>
<table cellspacing="0" class="results">
<thead>
	<tr><th>Match</th><th>Substring</th></tr>
</thead>
<tbody>
	<cfloop index="iMatch" from="1" to="#arrayLen(aRegexMatches)#">
		<cfset sRowClass = iMatch mod 2?'stripe':'nostripe'>
		<tr class="#sRowClass#">
			<td>#iMatch#</td>
			<cfif len(aRegexMatches[iMatch])>
				<td>#htmlEditFormat(aRegexMatches[iMatch])#</td>
			<cfelse>
				<td>&nbsp;</td>
			</cfif>
		</tr>
	</cfloop>
</tbody>
</table>
<cfelse>
No matches found
</cfif>
</cfoutput>
</cfsavecontent>
