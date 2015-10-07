<!--- 3041696 --->
<cfset getPageContext().getResponse().setHeader("expires", javaCast("String", "#dateAdd('s', 10, now())#"))>
<cfset getPageContext().getResponse().setHeader("expires", javaCast("String", "#dateAdd('n', 10, now())#"))>
<cfset getPageContext().getResponse().setHeader("expires", javaCast("String", "#dateAdd('h', 10, now())#"))>
output