<cfprocessingdirective pageencoding="utf-8">
<cfset s = "The next character is a 0x13 character:  ">
<cfset sX = xmlFormat(s,true)>

<cfxml variable="x">
	<doc>
		<cfoutput><node>#sX#</node></cfoutput>
	</doc>
</cfxml>
<cfdump var="#x#">
