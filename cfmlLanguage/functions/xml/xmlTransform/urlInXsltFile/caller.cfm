<cfset sPath = expandPath("./xsl/translations.xml")>
<cfset sX = fileRead(sPath, "UTF-8")>
<cfset obj = xmlParse("http://localhost:8301/shared/CF/CFML/functions/xml/xmlTransform/urlInXsltFile/xsl/translations.xml")>
<cfset xslParameters = structNew()>
<cfset xT = XmlTransform(obj, expandPath("xsl/stylesheet.xsl"), xslParameters)> 
<cfoutput>#xT#</cfoutput>
<cfdump var="#variables#">