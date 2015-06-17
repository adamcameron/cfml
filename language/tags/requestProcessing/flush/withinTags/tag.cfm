<cfif not isDefined("thisTag")>
	<cfthrow message="tag must he called as a custom tag" type="tag" errorcode="badCall">
</cfif>
<cfif not thisTag.hasEndTag>
	<cfthrow message="tag requires a closing tag" type="tag" errorcode="missingEndTag">
</cfif>

<cfif thisTag.executionMode eq "start">
	Above<br />
<cfelseif thisTag.executionMode eq "end">
	Below<br />
</cfif>