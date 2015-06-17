<cfparam name="attributes.column" type="string">
<cfif thistag.executionmode eq "start">
<cfset stOuter = getBaseTagData("cf_outer")>
<td><cfoutput>#stOuter.attributes.query[attributes.column][stOuter.counter]#</cfoutput></td>
</cfif>
