<cfset PageNamesMap12345 = "result.html">
<cfset StaticPage = "http://www.straker.co.nz/products.cfm?CatID=12345">
<cfset regExp = "products\.cfm\?CatID=([0-9]+)">
<cfset refNumber = reReplace(StaticPage, ".*#regExp#.*", '\1')>
<cfset StaticPage = reReplace(StaticPage, regExp, variables["PageNamesMap#refNumber#"])>

<cfoutput>#StaticPage#</cfoutput>