<cfset d1 = now()>
<cfset d2 = dateConvert("local2Utc", d1)>
<cfset st = getTimeZoneInfo()>
<cfdump var="#variables#">
