<cfform>
Who:
<cfinput type="text" name="artname" autosuggest="adam,alan,allan,allen,adrian,adrienne" typeahead="true" />
<br />
<cfinput type="submit" name="btnSubmit" value="Submit" />
</cfform>

<cfif structKeyExists(form, "fieldNames")>
<cfdump var="#form#">
</cfif>