<cfprocessingdirective pageencoding="utf-8">
<cfset s = "hihi，这是测试">

<cfloop index="i" from="1" to="#len(s)#">
	<cfset c= mid(s, i, 1)>
	<cfoutput>[#i#][#c#][#uCase(formatBaseN(asc(c), 16))#]<br /></cfoutput>
</cfloop>