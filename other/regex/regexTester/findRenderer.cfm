<!---
	included from Regex.cfc's processCfRegex() method
	assumes following variables exist:
	aRegexMatches
--->
<cfsavecontent variable="sReturnHtml">
	<cfif arrayLen(aRegexMatches)>
		<table cellspacing="0" class="results">
		<thead>
			<tr><th rowspan="2" valign="top">Match</th><th colspan="5">Details</th></tr>
			<tr><th>Subexpr</th><th>Position</th><th>Length</th><th>Substring</th><th>Context</th></tr>
		</thead>
		<tbody>
			<cfloop index="iMatch" from="1" to="#arrayLen(aRegexMatches)#">
				<cfset sRowClass = iMatch mod 2?'stripe':'nostripe'>
				<cfoutput>
					<tr class="#sRowClass#">
					
					<cfset iMatchCount = arrayLen(aRegexMatches[iMatch])>
					<td rowspan="#iMatchCount#">#iMatch#</td>
					<cfloop index="iSub" from="1" to="#iMatchCount#">
						<cfif iSub gt 1><tr class="#sRowClass#"></cfif>
							<td><cfif iSub eq 1>Entire<cfelse>#iSub-1#</cfif></td>
							<td>#aRegexMatches[iMatch][iSub].pos#&nbsp;</td>
							<td>#aRegexMatches[iMatch][iSub].len#&nbsp;</td>
							<cfif len(aRegexMatches[iMatch][iSub].str)>
								<td>#htmlEditFormat(aRegexMatches[iMatch][iSub].str)#</td>
								<td>#aRegexMatches[iMatch][iSub].context#</td>
							<cfelse>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</cfif>
						</tr>
					</cfloop>
				</cfoutput>
			</cfloop>
		</tbody>
		</table>
	<cfelse>
		No matches found
	</cfif>
</cfsavecontent>
