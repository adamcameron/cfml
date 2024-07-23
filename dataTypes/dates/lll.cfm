<cfset d = now()>
<cfset s = "#dateFormat(d, 'dd/mm/yyyy')# #timeFormat(d, 'HH:MM:SS.LLL')#">
<cfset sRegex = "\d{2}/\d{2}/\d{4}\s\d{2}:\d{2}:\d{2}.\d{3}">
<cfoutput>
	#d#: #timeFormat(d, "HH:MM:SS.LLL")#<br />
	#reFind(sRegex, s)#<br />
</cfoutput>