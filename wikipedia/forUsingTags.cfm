<!--- forUsingTags.cfm --->

<cfloop index="i" from="1" to="5">
	<!--- statements --->
	<cfoutput>#i#<br></cfoutput>
</cfloop>

<br><hr><br>

<cfloop index="i" list="1;2,3;4,5" delimiters=",;">
	<!--- statements --->
	<cfoutput>#i#<br></cfoutput>
</cfloop>

<br><hr><br>

<cfloop index="i" array="#[1,2,3,4,5]#">
	<!--- statements --->
	<cfoutput>#i#<br></cfoutput>
</cfloop>

<br><hr><br>



