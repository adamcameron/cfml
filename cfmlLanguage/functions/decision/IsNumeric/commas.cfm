<cftry>
	<cfparam name="URL.num" type="integer">
	<cfoutput>[#URL.num#] is numeric according to CFPARAM</cfoutput>
	<cfcatch>
		<cfoutput>[#URL.num#] is not numeric: [#cfcatch.message#] [#cfcatch.detail#]</cfoutput>
	</cfcatch>
</cftry>
<br />

<cfoutput>
	isNumeric(#URL.num#): [#isNumeric(URL.num)#]<br />
	val(#URL.num#): [#val(URL.num)#]<br />
</cfoutput>