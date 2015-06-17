<!--- noHoist.cfm --->
<cffunction name="test" output="true">
	<cfset var colour = "">
	<cfset var colours = ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"]>

	#serializeJson(colours)#<br>

	<cfloop array="#colours#" index="colour">
		#colour#<br>
	</cfloop>

</cffunction>

<cfset test()>