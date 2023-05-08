<!--- outputStringContainingChr7.cfm --->
<cfset s = chr(7) & "foo#chr(7)#">
<cfoutput>#s#:#len(s)#:#asc(left(s,1))#</cfoutput>