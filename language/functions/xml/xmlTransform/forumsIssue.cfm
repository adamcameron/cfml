<cfxml variable="xXsl">

<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="data/itemfeed.xml" --><!DOCTYPE xsl:stylesheet  [
    <!ENTITY nbsp  "&#160;">
    <!ENTITY copy  "&#169;">
    <!ENTITY reg    "&#174;">
    <!ENTITY trade  "&#8482;">
    <!ENTITY mdash  "&#8212;">
    <!ENTITY ldquo  "&#8220;">
    <!ENTITY rdquo  "&#8221;">
    <!ENTITY pound  "&#163;">
    <!ENTITY yen    "&#165;">
    <!ENTITY euro  "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">

 

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>

 

<body>
<xsl:for-each select="Items/Item[ItemType='Standard']">
<xsl:value-of select="EANNumber"/>

 

</xsl:for-each>
</body>
</html>

 

</xsl:template>
</xsl:stylesheet>
</cfxml>
<cfxml variable="xXml">
<?xml version="1.0" encoding="UTF-8" ?>
<Items>
    <Item>
        <ItemType>Standard</ItemType>
        <EANNumber>111222333444</EANNumber>
    </Item>
</Items>
</cfxml>

<cfoutput>#xmlTransform(xXml, xXsl)#</cfoutput>