<!--- indexedLoop.cfm --->
<cffunction name="test" output="true">
	<cfset var colours = ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"]>

	#serializeJson(colours)#<br>

	<cfloop index="i" from="1" to="#arrayLen(colours)#">
		<cfset colour = colours[i]>
		#colour#<br>
	</cfloop>

	<cfset var colour = "">
</cffunction>

<cfset test()>