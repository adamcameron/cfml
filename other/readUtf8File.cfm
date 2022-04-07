<cffile action="readbinary" file="C:\temp\s.txt" variable="s">

<cfdump var="#s#"label="#len(toString(s))#">

<!--- <cfloop index="i" from="1" to="#len(s)#">
	<cfset c= mid(s, i, 1)>
	<cfoutput>[#i#][#c#][#asc(c)#]<br /></cfoutput>
</cfloop> --->