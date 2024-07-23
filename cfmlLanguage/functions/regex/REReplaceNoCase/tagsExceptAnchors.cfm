<cfsavecontent variable="sSrc">
<font face="Arial" size="2"><a href="/Latitude-Longitude-545478-Louisiana-Achiquot_Bay.html">Achiquo t Bay</a></font>
<font face="Arial" size="2">Bay
<font face="Arial" size="2">Avoyelles
<font face="Arial" size="2">LA
<font color="CCDFCA"></font>
<font face="Arial" size="2"><a href="/Latitude-Longitude-1629555-Louisiana-Adolph_Clarks_Pond__histo rical_.html">Adolph Clarks Pond (historical)</a></font>
<font face="Arial" size="2">Bay
<font face="Arial" size="2">Plaquemines
<font face="Arial" size="2">LA
<font color="CCDFCA"></font>
</cfsavecontent>

<cfset sRegex = "(?!</?\ba\b[^>]*?>)</?[a-z]+?[^>]*?>">
<cfset sBase = reReplaceNoCase(sSrc, sRegex, "", "ALL")>
<cfset sLeadingAnchor = reReplaceNoCase('<a href="/path/to/file.html">Link</a>' & sSrc, sRegex, "", "ALL")>
<cfset sLeadingCloseAnchor = reReplaceNoCase('</a>' & sSrc, sRegex, "", "ALL")>
<cfset sOthertagStartingWithA = reReplaceNoCase('<address>home</address>' & sSrc, sRegex, "", "ALL")>

<cfdump var="#variables#">
