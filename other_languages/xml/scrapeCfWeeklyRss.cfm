<cfset x = xmlParse("C:\temp\rss.xml")>
<cfset a = xmlSearch(x, "//enclosure")>
<cfloop index="i" from="1" to="#arrayLen(a)#">
	<cfoutput><a href="#a[i].xmlAttributes.url#">#a[i].xmlAttributes.url#</a><br /></cfoutput>
</cfloop>