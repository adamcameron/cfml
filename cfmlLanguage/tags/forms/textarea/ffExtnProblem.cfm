<cfparam name="form.richText1" default="">

<cfform method="post" action="#CGI.script_name#" format="html">
	<cftextarea name="richtext1" html="true" richtext="true"><cfoutput>#form.richtext1#</cfoutput></cftextarea><br />
	<input type="submit" name="btnSubmit" value="Submit" />
</cfform>

<cfif structKeyExists(form, "btnSubmit")>
<cfdump var="#form#">
</cfif> 