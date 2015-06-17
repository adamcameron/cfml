

<cfparam name="form.s" default="">

<cfform>
	<cfselect name="s" bind="cfc:bind.getOptions()" display="display" value="value" selected="#form.s#" bindonload="true" />
	<cfinput type="submit" name="btnSubmit" value="Submit" />
</cfform>

<cfif structKeyExists(form, "fieldNames")>
	<cfdump var="#form#" format="text">
</cfif>
