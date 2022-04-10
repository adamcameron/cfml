<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<h1>We should have hello after this text</h1>

<xsl:for-each select="document('xsl/translations.xml')">
	<h2>hello</h2>
</xsl:for-each>

<h1>We should have hello before this text</h1>
</xsl:template>
</xsl:stylesheet>
