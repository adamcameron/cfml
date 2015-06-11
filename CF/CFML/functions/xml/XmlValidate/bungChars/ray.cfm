<cfprocessingdirective pageencoding="utf-8">

<cfsavecontent variable="badtext">
In reality, you might have only a short description, such as, “We want to personalize our online store,” or, “We need an accounting section in the company intranet.”
</cfsavecontent>

<cfset myxml = xmlFormat(badtext)>
<cfoutput>#myxml#</cfoutput>