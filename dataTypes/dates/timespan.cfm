<cfset ts = createTimeSpan(1,1,1,1)>
<cfset ts = createTimeSpan(6,0,0,0)>

<cfset start = now()>
<cfset end = dateAdd("w", 1, start)>

<cfoutput>
#ts#<br />
#start#<br />
#end#<br />
</cfoutput>