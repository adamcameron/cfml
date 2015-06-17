<cfform method="post" action="./demo.cfm">
	<cfcalendar	name = "dBirthday"
				dayNames = "S,M,T,W,T,F,S"
				disabled = "FALSE"
				enabled = "TRUE"
				endRange = "#createDate(1970,1,1)#"
				height = "400"
				mask = "yyyy-mm-dd"
				monthNames = "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec"
				selectedDate = "#now()#"
				startRange = "#now()#"
				tooltip = "Select your birthday"
				visible = "TRUE"
				width = "400"
	>
<br />
<input type="submit" name="btnSubmit" value="Go &raquo;" />
</cfform>

<cfif structCount(form) gt 0>
	<cfdump var="#form#">
	<cfset d1 = parseDateTime(form.dBirthday)>
	<cfset d2 = createDate(year(d1), month(d1), day(d1))>
	<cfdump var="#variables#">
</cfif>
