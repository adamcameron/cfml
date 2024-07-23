<cffile action="read" file="C:\webroots\cf8_77x\uk\ac\herts\services\cluster\config.xml" variable="s">

<cfset x = xmlParse(s)>

<cfset a = xmlSearch(x, "/cluster/local[@name='uhweb.straker-interactive.com']/remote")>
<cfdump var="#variables#">