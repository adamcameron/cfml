<!--- x = myxmldoc["my-list"]["my-item][i]["user-id"]["xmltext"] --->

<cfxml variable="myxmldoc">
	<my-list>
		<my-item>
			<user-id>one</user-id>
		</my-item>
		<my-item>
			<user-id>deux</user-id>
		</my-item>
		<my-item>
			<user-id>drei</user-id>
		</my-item>
		<my-item>
			<user-id>wha</user-id>
		</my-item>
		<my-item>
			
		</my-item>
	</my-list>
</cfxml>
<cfoutput>#arrayLen(myxmldoc["my-list"]["my-item"])#<br /></cfoutput>
<cfloop index="i" from="1" to="5">
	<cfif structKeyExists(myxmldoc["my-list"]["my-item"][i], "user-id")>
		<cfoutput>#myxmldoc["my-list"]["my-item"][i]["user-id"]["xmltext"]#<br /></cfoutput>
	</cfif>
</cfloop>
