<!--- outputStringContainingChr0.cfm --->
<cfset s = chr(0) & "foo#chr(0)#">
<cfoutput>#s#:#len(s)#:#asc(left(s,1))#</cfoutput>