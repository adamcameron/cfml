<cfset NowDate = CreateDate(2010, 5, 21)>
<cfoutput>
	NowDate = #NowDate#<br />

	<cfloop index="iMonth" from="4" to="1" step="-1">
		<cfset UseThisDate = CreateDate(2010, iMonth, daysinMonth(createDate(2010, iMonth, 1)))>
		<cfset MyDateDiff = DateDiff("d", UseThisDate, NowDate)>
		#dateFormat(UseThisDate, "dd/mm/yyyy")# - #dateFormat(nowDate, "dd/mm/yyyy")# = #MyDateDiff#<br />
	</cfloop>
	
	<cfloop index="iMonth" from="12" to="5" step="-1">
		<cfset UseThisDate = CreateDate(2009, iMonth, daysinMonth(createDate(2009, iMonth, 1)))>
		<cfset MyDateDiff = DateDiff("d", UseThisDate, NowDate)>
		#dateFormat(UseThisDate, "dd/mm/yyyy")# - #dateFormat(nowDate, "dd/mm/yyyy")# = #MyDateDiff#<br />
	</cfloop>

</cfoutput>