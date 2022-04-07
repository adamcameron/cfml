<cfxml variable="xTest">
	<job>
		<employee id="11"/>
		<employee id="12"/>
		<employee id="3453453"/>
	</job>
</cfxml>

<cfset sXSL = "
<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
	<xsl:output method=""text""/>
	<xsl:strip-space elements=""*""/>
	<xsl:template match=""/job/employee[@id]"">
		<xsl:value-of select=""@id""/><xsl:text>,</xsl:text>
	</xsl:template>
</xsl:stylesheet>
">

<cfoutput><pre>#xmlTransform(xTest, sXSL)#</pre></cfoutput>