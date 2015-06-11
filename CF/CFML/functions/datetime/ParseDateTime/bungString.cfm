<cfset s = "Tue January 05 09:30:42 EDT 2010">
<cfoutput>
isDate(s): #isDate(s)#<br />
isValid("date", s)  : #isValid("date", s)#<br />
isValid("usdate", s)  : #isValid("usdate", s)#<br />
isValid("eurodate", s)  : #isValid("eurodate", s)#<br />
parseDateTime(s): #parseDateTime(s)#<br />
<!---lsParseDateTime(s): #lsParseDateTime(s)#<br />--->
</cfoutput>