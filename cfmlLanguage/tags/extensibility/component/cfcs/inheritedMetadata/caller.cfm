<cfset o = createObject("component", "c")>
<cfset stMetadata = getMetadata(o)>
<cfdump var="#stMetadata#">
<cfset aMethods=structFindKey(stMetadata, "functions", "ALL")>
<cfdump var="#aMethods#">
