<cfoutput>
<cfloop index="i" from="1" to="10">
	#dateFormat(dateAdd("w", i , now()), "DDD dd/mm/yyyy")#<br />
</cfloop>
<hr />
#dateFormat(dateAdd("w", 1, createDate(2010, 6, 19)), "DDD dd/mm/yyyy")#<br /><!--- ie: it's a SATURDAY --->
</cfoutput>