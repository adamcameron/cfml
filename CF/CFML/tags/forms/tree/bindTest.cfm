<cfform method="post" action="#CGI.script_name#">
<cftree	name		= "treeSelection"
		cache		= "false"
		completepath= "true"
		delimiter	= "."
		format		= "html"
		height		= "320"
		required	= "true"
		width		= "500"
>
	<cftreeitem	bind="cfc:shared.cf.cfml.T.tree.BindTest.getNodes({cftreeitempath} , {cftreeitemvalue})"/>
</cftree>
<br />
<cfinput type="submit" name="btnSubmit" value="Submit" />
</cfform>

<cfif structKeyExists(form, "fieldNames")>
<cfdump var="#form#">
</cfif>