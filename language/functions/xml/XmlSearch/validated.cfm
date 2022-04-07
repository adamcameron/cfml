<cffile action="read" file="#expandPath('./validated.xml')#" variable="s">

<cfset x = xmlParse(s, true, expandPath("/shared/cf/bifs/xml/xmlsearch/validated.dtd"))>
<cfdump var="#x#">

<cfset a = xmlSearch(x, "//bbb")>
<cfdump var="#a#">

<cfset a = xmlSearch(s, "//bbb")>
<cfdump var="#a#">