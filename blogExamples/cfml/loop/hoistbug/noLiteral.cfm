<!--- noLiteral.cfm --->
<cffunction name="test" output="true">
	<cfset var colours = arrayNew(1)>
	<cfset colours[1] = "whero">
	<cfset colours[2] = "karaka">
	<cfset colours[3] = "kowhai">
	<cfset colours[4] = "kakariki">
	<cfset colours[5] = "kikorangi">
	<cfset colours[6] = "tawatawa">
	<cfset colours[7] = "mawhero">
	#serializeJson(colours)#<br>

	<cfloop array="#colours#" index="colour">
		#colour#<br>
	</cfloop>

	<cfset var colour = "">
</cffunction>
  
<cfset test()>