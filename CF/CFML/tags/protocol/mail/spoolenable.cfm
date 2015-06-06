<cfset msg = "TEST#timeFormat(now(), 'HHMM')#">
<cftry>
	<cfmail spoolenable="no" from="from@example.com" subject="#msg#"  cc="cc@example.com" bcc="bcc@example.com">
		#msg#
	</cfmail>
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>