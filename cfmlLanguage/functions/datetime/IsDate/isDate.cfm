<cfset s = "00/01/07">
<cfoutput>
isDate("#s#"): [#isDate(s)#]<br />
year("#s#"): [#year(s)#]<br />
month("#s#"): [#month(s)#]<br />
day("#s#"): [#day(s)#]<br />
parseDateTime("#s#"): [#parseDateTime(s)#]<br />
</cfoutput>