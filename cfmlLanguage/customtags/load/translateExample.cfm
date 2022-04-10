<!--- translateExample.cfm --->
<link rel="stylesheet" href="lib/css/styles.css">
<cfimport taglib="lib/tags" prefix="doc">
<p>This is a demo of the translator:
<dl>
<cfloop array="#['one','two','three','four']#" index="number">
	<cfoutput><dt>#number#</dt><dd><doc:translate>#number#</doc:translate></dd></cfoutput>
</cfloop>
<dt>five</dt><dd><doc:translate>five</doc:translate></dd>
</dl>
</p>