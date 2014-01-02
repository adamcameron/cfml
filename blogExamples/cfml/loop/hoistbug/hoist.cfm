<!--- hoist.cfm --->
<cffunction name="test" output="true">
	<cfset var colours = ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"]>

	#serializeJson(colours)#<br>

	<cfloop array="#colours#" index="colour">
		#colour#<br>
	</cfloop>

	<cfset var colour = "">
</cffunction>

<cfset test()>