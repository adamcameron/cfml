<cfset sDir = "C:\webroots\dev\baboon\app_templates\objects\sox">

<cfdirectory action="list" directory="#sDir#" name="qDir" filter="*2007010120070131.xml">
<cfdump var="#qDir#">

<cfoutput query="qDir">
	<cfif type eq "file">
		dateLastmodified: [#dateLastmodified#] ; dateFormat(dateLastmodified, 'yyyy-mm-dd'): [#dateFormat(dateLastmodified, 'yyyy-mm-dd')#]<br />
	</cfif>
</cfoutput>