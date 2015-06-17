<cfflush interval="50">
<!---
<cfset x = xmlParse("C:\webroots\shado76\p8apps\metadata\data\types\msf\countries.xml")>
<cfset s = tostring(x)>
--->
<cffile action="read" file="C:\webroots\shado76\p8apps\metadata\data\types\msf\countries.xml" variable="s" charset="utf-8">
<cffile action="write" file="C:\webroots\shado76\p8apps\metadata\data\types\msf\countries2.xml" output="#s#" charset="utf-8">
<cffile action="read" file="C:\webroots\shado76\p8apps\metadata\data\types\msf\countries2.xml" variable="s" charset="iso-8859-1">
<cffile action="read" file="C:\webroots\shado76\p8apps\metadata\data\types\msf\countries.xml" variable="s" charset="iso-8859-1">
<cfdump var="#s#">
<!---
<cfloop index="i" from="1" to="#len(s)#">
	<cfset c = mid(s, i, 1)>
	<cfoutput>[#i#][#c#][#asc(c)#]<br /></cfoutput>
</cfloop>
--->