<cfxml variable="xTest">
	<jobs>
		<job>
			<employee code="1"/>
			<employee code="2"/>
			<employee code="3"/>
		</job>
		<job>
			<employee code="0"/>
			<employee code="1"/>
			<employee code="2"/>
			<employee code="3"/>
		</job>
	</jobs>
</cfxml>

<cfset sXSL = "
<xsl:stylesheet version = '1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
	<xsl:output method=""text""/>
	<xsl:strip-space elements=""*""/>
	<xsl:template match=""/jobs/job[1]"">
		<xsl:value-of select=""count(/jobs/job[1]/employee[@code=2]/preceding-sibling::employee)+1""/>
	</xsl:template>
</xsl:stylesheet>
">

<cfoutput><pre>#xmlTransform(xTest, sXSL)#</pre></cfoutput>