<cfparam name="form.creditExpY" default="#year(now())#">
<cfform>
<cfselect enabled="No" name="creditExpY" multiple="no" selected="#form.creditExpY#">
<cfloop from="#year(now())#" to="#val(year(now())+10)#" index="x">
<cfoutput><option value="#x#">#x#</option></cfoutput>
</cfloop>
</cfselect>
<input type="submit" name="btnSubmit" value="Submit" />
</cfform>


<cfdump var="#form#">