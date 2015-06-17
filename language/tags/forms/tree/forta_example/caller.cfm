<cfform method="post" action="./caller.cfm">
<cftree name="dirtree" format="html">
	<cftreeitem bind="cfc:dirtree.getDirEntries({cftreeitempath}, {cftreeitemvalue})">
</cftree>
<br />
<input type="submit" name="btnSubmit" value="Go &raquo;" />
</cfform>

<cfdump var="#form#">