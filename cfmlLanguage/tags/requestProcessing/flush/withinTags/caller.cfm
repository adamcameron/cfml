<cfparam name="URL.lines" default="100" type="integer">
<cfflush interval="50">
<!--- <cf_tag> --->
	<cfloop index="i" from="1" to="#URL.lines#">
		<cfoutput>Line [#i#]: #createUuid()#<br />#repeatString(chr(9), 100)#</cfoutput>
	</cfloop>
<!--- </cf_tag> --->