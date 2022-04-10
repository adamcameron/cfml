<cfdump var="#GetTimeZoneInfo()#">

<cfoutput>
	#dateFormat(now(), "yyyy-mm-dd")#T#timeFormat(now(), "HH:mm:ss.L")##numberFormat(GetTimeZoneInfo().utcHourOffset, "+00")#:#numberFormat(GetTimeZoneInfo().utcMinuteOffset, "00")#<br />
	#dateFormat(now(), "yyyy-mm-dd")#T#timeFormat(now(), "HH:mm:ss.l")##numberFormat(GetTimeZoneInfo().utcHourOffset, "+00")#:#numberFormat(GetTimeZoneInfo().utcMinuteOffset, "00")#<br />
</cfoutput>