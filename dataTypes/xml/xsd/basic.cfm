<cfset x = xmlParse(expandPath("./basic.xml"), true, expandPath("./basic.xsd"))>
<cfdump var="#x#">
