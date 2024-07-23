<cfset d = now()>
<cfoutput>
	dateFormat("#d#"): #dateFormat(d)#<br />
	dateFormat("#d#", "short"): #dateFormat(d, "short")#<br />
	dateFormat("#d#", "medium"): #dateFormat(d, "medium")#<br />
	dateFormat("#d#", "long"): #dateFormat(d, "long")#<br />
	dateFormat("#d#", "full"): #dateFormat(d, "full")#<br />
	<hr />
	lsDateFormat("#d#"): #lsDateFormat(d)#<br />
	lsDateFormat("#d#", "short"): #lsDateFormat(d, "short")#<br />
	lsDateFormat("#d#", "medium"): #lsDateFormat(d, "medium")#<br />
	lsDateFormat("#d#", "long"): #lsDateFormat(d, "long")#<br />
	lsDateFormat("#d#", "full"): #lsDateFormat(d, "full")#<br />
	<hr />
</cfoutput>